class UsersController < CardsController

  def show
    @user = current_user
    if @user.card.present? 
      public_method(:show).super_method.call
    end
  end

  def stocks
    @user = User.find_by(id: params[:id])
    @stocks = Stock.where(user_id: @user.id)
  end
end
