class SurgicalOperationsController < ApplicationController

  def index
    @surgical_operations = SurgicalOperation.all
  end

  def new
    @surgical_operation = SurgicalOperation.new
  end

  def create
    @surgical_operation = SurgicalOperation.new(surgical_operation_params)
    if @surgical_operation.save
      redirect_to surgical_operations_path, notice: t('view.create_content')
    else
      render :new
    end
  end

  def show
    @surgical_operation = SurgicalOperation.find(params[:id])
  end

  private
  def surgical_operation_params
    params.require(:surgical_operation).permit(:title, :content)
  end
end
