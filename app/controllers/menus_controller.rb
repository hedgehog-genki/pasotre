class MenusController < ApplicationController
  def show
    @menus = Menu.find_by(user_id: current_user.id)
  end
end
