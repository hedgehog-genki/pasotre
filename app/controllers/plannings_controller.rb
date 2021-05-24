class PlanningsController < ApplicationController
  require 'securerandom'
  before_action :require_user_logged_in, only: [:index, :new, :create]

  def index
    this_set = Menu.where(user_id: current_user.id).order(created_at: :desc).first.set  # ログインユーザが作成したメニューのセット値
    @menus = Menu.where(user_id: current_user.id).where(set: this_set).order(num: :asc) # セット値が同じメニューを出力
  end

  def new
    @planning = Planning.new
  end

  def create
    @planning = current_user.plannings.build(planning_params)
    @planning.save
    # @planning = Planning.find_by(user_id: current_user.id)
    todayLevel = (@planning.level * @planning.condition).ceil + @planning.adjustment
    i = 0
    @sumTime = 0

    this_set = SecureRandom.alphanumeric(10)
    while @sumTime < @planning.allowed_time # 時間が許す限りメニューを追加していく
      # トレーニングを選んでくる処理
      if i % 2 == 0
        training = Training.where(part: @planning.focus).sample  # 集中鍛錬部位に合致するトレーニングを1個選ぶ (後でランダム選択にする)
      else
        training = Training.where.not(part: @planning.focus).sample  # 集中鍛錬部位以外のトレーニングを1個選ぶ
      end

      # i 番目のメニューを作成する処理
      menu = Menu.new # インスタンスを作成
      menu.user_id = current_user.id
      menu.training_id = training.id 
      menu.count = (training.basis * todayLevel).ceil # 基礎レベルに倍率をかけて回数を算出
      menu.num = i # 何番目のメニューであるか
      menu.set = this_set
      menu.save

      time = ((training.time).to_f / 60 * menu.count).ceil # このトレーニングに要する時間を 1 分単位で算出
      @sumTime += time # 所要時間の計算に加算
      i += 1
    end

    redirect_to plannings_path  # 今日のメニュー一覧に遷移
    flash[:success] = "メニューを作成しました"

  end

  private
    def planning_params
      params.require(:planning).permit(:level, :condition, :adjustment, :focus, :allowed_time)
    end
end
