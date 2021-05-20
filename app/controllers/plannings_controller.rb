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
    # @planning = Planning.find_by(user_id: current_user.id)
    # @menus = Training.all
    @menus = [{ name: 'スクワット', 'count': 10}, { name: '腕立て伏せ', 'count': 20}]
  end

  private
    def planning_params
      params.require(:planning).permit(:condition, :adjustment, :focus, :allowed_time)
    end
end
