class SurgicalOperationMailer < ApplicationMailer
  def surgical_operation_mail(users, surgical_operation)
    @surgical_operation = surgical_operation
    mail to: users.map{ |u| u.email }, subject: "手順作成・編集時の確認メール"
  end

  def comment_mail(users, surgical_operation, comment)
    @comment = comment
    @surgical_operation = surgical_operation
    mail to: users.map{ |u| u.email }, subject: "手順に対するコメントの確認メール"
  end

  def notify_user_mail(user, surgical_operation)
    @user = user
    @surgical_operation = surgical_operation
    mail to: "#{@user.email}", subject: "#{@user.name}さんの未読の手順確認メール"
  end
end

