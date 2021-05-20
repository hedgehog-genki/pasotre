class PlanningsController < ApplicationController

  before_action :require_user_logged_in, only: [:new, :create, :show]

  def new
    @planning = Planning.new
  end

  def create
    @planning = current_user.plannings.build(planning_params)
    @planning.level = Planning.find_by(user_id: current_user.id).level

    # if @planning.level.nil?
    #   @planning.level = 10
    # end

    if @planning.save
      redirect_to root_path
      flash[:success] = "メニューを作成しました"
    else
      redirect_to root_path
      flash[:alert] = "メニューを作成できませんでした"
    end

  end

  private
    def planning_params
      params.require(:planning).permit(:condition, :adjustment, :focus, :allowed_time)
    end
end
