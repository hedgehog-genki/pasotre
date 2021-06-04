class MenusController < ApplicationController
  def index
    @menus = Menu.where(user_id: current_user.id).where("created_at >= ?", Date.today)
  end
end
