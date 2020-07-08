class StocksController < ApplicationController
  def create
    stock = current_user.stocks.create(surgical_operation_id: params[:surgical_operation_id])
    redirect_to surgical_operation_path(id: params[:surgical_operation_id]), notice: "#{stock.surgical_operation.title}をストックしました"
  end

  def destroy
    stock = current_user.stocks.find_by(id: params[:id]).destroy
    redirect_to surgical_operation_path(id: params[:surgical_operation_id]), notice: "#{stock.surgical_operation.title}のストックを解除しました"
  end
end