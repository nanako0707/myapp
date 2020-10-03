class CommentsController < ApplicationController
  before_action :set_surgical_operation, only: [:create, :edit, :update]
  def create
    @comment = @surgical_operation.comments.build(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        @surgical_operation.create_notification_comment(current_user, @comment.id)
        format.js { render :index }
        users = User.all
        SurgicalOperationMailer.comment_mail(users, @surgical_operation, @comment).deliver
      else
        format.html { redirect_to surgical_operation_path(@surgical_operation), notice: t('view.can\'t_post') }
      end
    end
  end

  def edit
    @comment = @surgical_operation.comments.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = t('view.in_comments')
      format.js { render :edit }
    end
  end

  def update
    @comment = @surgical_operation.comments.find(params[:id])
      respond_to do |format|
        if @comment.update(comment_params)
          flash.now[:notice] = t('view.edit_comment_message')
          format.js { render :index }
          users = User.all
          SurgicalOperationMailer.comment_mail(users, @surgical_operation, @comment).deliver
        else
          flash.now[:notice] = t('view.comment_failure')
          format.js { render :edit_error }
        end
      end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      flash.now[:notice] = t('view.destroy_comment_message')
      format.js { render :index }
    end
  end

  private
  
  def comment_params
    params.require(:comment).permit(:surgical_operation_id, :content)
  end

  def set_surgical_operation
    @surgical_operation = SurgicalOperation.find(params[:surgical_operation_id])
  end
end
