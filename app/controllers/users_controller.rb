class UsersController < ApplicationController

  def stocks
    @user = User.find_by(id: params[:id])
    @stocks = Stock.where(user_id: @user.id)
  end
end
