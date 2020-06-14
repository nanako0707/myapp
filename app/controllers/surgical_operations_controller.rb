class SurgicalOperationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_surgical_operation, only: [:show, :edit, :update]

  def index
    @surgical_operations = SurgicalOperation.all.order(created_at: :desc)
  end

  def new
    @surgical_operation = SurgicalOperation.new
  end

  def create
    @surgical_operation = current_user.surgical_operations.build(surgical_operation_params)
    if @surgical_operation.save
      redirect_to surgical_operations_path, notice: t('view.create_content')
    else
      render :new
    end
  end

  def show
    @stock = current_user.stocks.find_by(surgical_operation_id: @surgical_operation.id)
  end

  def edit
  end

  def update
    if @surgical_operation.update(surgical_operation_params)
      redirect_to surgical_operations_path, notice: t('view.edit_content')
    else
      render :edit
    end
  end

  private
  def surgical_operation_params
    params.require(:surgical_operation).permit(:title, :content)
  end

  def set_surgical_operation
    @surgical_operation = SurgicalOperation.find(params[:id])
  end
end
