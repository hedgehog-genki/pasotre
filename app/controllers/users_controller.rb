class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show]
  before_action :correct_user, only: [:show]
  def show
    @user = User.find(params[:id])
    if Planning.find_by(user_id: current_user.id).nil?
      @level = 10
    else
      @level = Planning.find_by(user_id: current_user.id).level
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def correct_user
    # ログイン中のユーザ以外の情報を表示しようとした時
    if User.find_by(id: params[:id]) != current_user.id
      params[:id] = current_user.id
    end
  end
end
