class SurgicalOperationsController < ApplicationController
  before_action :set_surgical_operation, only: [:show, :edit, :update]

  def index
    if params[:sort_medical_department]
      @surgical_operations = SurgicalOperation.order(medical_department: :desc)
    elsif params[:sort_updated_at]
      @surgical_operations = SurgicalOperation.order(updated_at: :desc)
    else
      @surgical_operations = SurgicalOperation.all.order(created_at: :desc)
    end
  end

  def new
    @surgical_operation = SurgicalOperation.new
  end

  def create
    @surgical_operation = current_user.surgical_operations.build(surgical_operation_params)
    users = User.all
    if @surgical_operation.save
      # SurgicalOperationMailer.surgical_operation_mail(users, @surgical_operation).deliver
      SurgicalOperationMailer.notify_user(users, @surgical_operation, @reading).deliver
      redirect_to surgical_operations_path, notice: t('view.create_content')
    else
      render :new
    end
  end

  def show
    @reading = current_user.readings.update(complete: true)
    @stock = current_user.stocks.find_by(surgical_operation_id: @surgical_operation.id)
    @comments = @surgical_operation.comments
    @comment = @surgical_operation.comments.build
  end

  def edit
  end

  def update
    if @surgical_operation.update(surgical_operation_params)
      users = User.all
      
      redirect_to surgical_operations_path, notice: t('view.edit_content')
    else
      render :edit
    end
  end

  private
  def surgical_operation_params
    params.require(:surgical_operation).permit(:title, :content, :image, :status, :medical_department)
  end

  def set_surgical_operation
    @surgical_operation = SurgicalOperation.find(params[:id])
  end
end
