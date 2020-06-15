class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def stocks
    @user = User.find_by(id: params[:id])
    @stocks = Stock.where(user_id: @user.id)
  end
end
