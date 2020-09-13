class SurgicalOperationsController < ApplicationController
  before_action :set_surgical_operation, only: [:show, :edit, :update, :pay]
  before_action :admin_user, only: :destroy
  before_action :ensure_premium_user, {only: [:new, :create, :edit, :update]}
  
  def index
    @q = SurgicalOperation.ransack(params[:q])
    @surgical_operations = @q.result(distinct: true).page(params[:page]).per(12)
  end

  def new
    @surgical_operation = SurgicalOperation.new
  end

  def create
    @surgical_operation = current_user.surgical_operations.build(surgical_operation_params)
    if @surgical_operation.save
      users = User.all
      SurgicalOperationMailer.surgical_operation_mail(users, @surgical_operation).deliver
      redirect_to surgical_operations_path, notice: t('view.create_content')
    else
      render :new
    end
  end

  def show
    @reading = Reading.create(surgical_operation_id: @surgical_operation.id, user_id: current_user.id)
    @stock = current_user.stocks.find_by(surgical_operation_id: @surgical_operation.id)
    @comments = @surgical_operation.comments
    @comment = @surgical_operation.comments.build
  end

  def edit
  end

  def update
    if @surgical_operation.update(surgical_operation_params)
      users = User.all

      users.each do |user|
        @readings = Reading.where(surgical_operation_id: @surgical_operation.id, user_id: user.id).delete_all
      end
      SurgicalOperationMailer.surgical_operation_mail(users, @surgical_operation).deliver
      redirect_to surgical_operations_path, notice: t('view.edit_content')
    else
      render :edit
    end
  end

  def ensure_premium_user
    if User.where(id: current_user.id, premium: false).exists? 
      flash[:notice] = t('view.premium_member')
      redirect_to surgical_operations_path
    end
  end

  def destroy
    @surgical_operation.destroy
    redirect_to surgical_operations_path, notice: t('view.destroy_surgical_operation')
  end

  def admin_user
    @surgical_operation = SurgicalOperation.find_by(id: params[:id])
    unless current_user.try(:admin?)
      flash[:notice] = t("view.not_authorized")
      redirect_to surgical_operations_path
    end
  end

  private
  def surgical_operation_params
    params.require(:surgical_operation).permit(:title, :content, :image, :status, :medical_department, :price)
  end

  def set_surgical_operation
    @surgical_operation = SurgicalOperation.find(params[:id])
  end
end
