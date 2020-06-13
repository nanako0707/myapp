class SurgicalOperationsController < ApplicationController

  def index
    @surgical_operations = SurgicalOperation.all
  end

  def new
    @surgical_operation = SurgicalOperation.new
  end

  def create
    SurgicalOperation.create(surgical_operation_params)
    redirect_to new_surgical_operation_path
  end

  def show
    @surgical_operation = SurgicalOperation.find(params[:id])
  end

  private
  def surgical_operation_params
    params.require(:surgical_operation).permit(:title, :content)
  end
end
