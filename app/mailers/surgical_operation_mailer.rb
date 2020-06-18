class SurgicalOperationMailer < ApplicationMailer
  def surgical_operation_mail(users, surgical_operation)
    @surgical_operation = surgical_operation
    mail to: users.map{ |u| u.email }, subject: "手順作成・編集時の確認メール"
  end

  def notify_user(users, surgical_operation)
    @surgical_operation = surgical_operation
    mail to:users.map{ |u| u.email }, subject: "今週変更のあった#{user.name}さんが未読の手順"
  end
end
