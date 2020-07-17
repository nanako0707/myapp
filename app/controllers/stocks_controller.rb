class StocksController < ApplicationController
  def create
    stock = current_user.stocks.new(surgical_operation_id: params[:surgical_operation_id])
    stock.save
    @surgical_operation = SurgicalOperation.find(params[:surgical_operation_id])
    @surgical_operation.create_notification_by(current_user)
    redirect_to surgical_operation_path(id: params[:surgical_operation_id]), notice: "#{stock.surgical_operation.title}をストックしました"
  end

  def destroy
    stock = current_user.stocks.find_by(id: params[:id]).destroy
    redirect_to surgical_operation_path(id: params[:surgical_operation_id]), notice: "#{stock.surgical_operation.title}のストックを解除しました"
  end
end