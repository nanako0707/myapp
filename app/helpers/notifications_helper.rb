module NotificationsHelper

  def get_notifications
    @notifications = current_user.passive_notifications.page(params[:page]).per(20)
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end

  def notification_form(notification)
    @visitor = notification.visitor
    @comment = nil
    your_surgical_operation = link_to 'あなたの投稿', surgical_operation_path(notification), style:"font-weight: bold;"
    @visitor_comment = notification.comment_id
    case notification.action
      when "stock" then
        tag.a(notification.visitor.name, style:"font-weight: bold;")+"さんが"+tag.a('あなたの投稿', href:surgical_operation_path(notification.surgical_operation_id), style:"font-weight: bold;")+"をストックしました"
      when "comment" then
        @comment = Comment.find_by(id: @visitor_comment)&.content
        tag.a(@visitor.name, style:"font-weight: bold;")+"さんが"+tag.a('あなたの投稿', href:surgical_operation_path(notification.surgical_operation_id), style:"font-weight: bold;")+"にコメントしました"
    end
  end

  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end
end