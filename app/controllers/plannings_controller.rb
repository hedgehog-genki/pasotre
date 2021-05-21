class PlanningsController < ApplicationController

  before_action :require_user_logged_in, only: [:new, :create, :show]

  def new
    @planning = Planning.new
  end

  def create
    @planning = current_user.plannings.build(planning_params)
    @planning.level = Planning.find_by(user_id: current_user.id).level

    if @planning.save
      redirect_to root_path
      flash[:success] = "メニューを作成しました"
    else
      redirect_to root_path
      flash[:alert] = "メニューを作成できませんでした"
    end
  end

  def show
    # 配列にハッシュを格納していけばいい
    @planning = Planning.find_by(user_id: current_user.id)
    todayLevel = (@planning.level * @planning.condition).ceil + @planning.adjustment

    @menus = []

    i = 0
    sumTime = 0

    while sumTime < @planning.allowed_time
      if i % 2 == 0
        training = Training.where(part: @planning.focus).first  # ランダムにする
      else
        training = Training.where.not(part: @planning.focus).first  # ランダムにする
      end

      count = (training.basis * todayLevel).ceil # 回数を算出
      time = ((training.time).to_f / 60 * count).ceil # x/60[分/回] * y 回 = xy/60 hunn 
      sumTime += time    

      @menus[i] = {
        name: training.name,
        count: count,
        time: time
       }

      i += 1

    end

  end

  private
    def planning_params
      params.require(:planning).permit(:condition, :adjustment, :focus, :allowed_time)
    end
end
