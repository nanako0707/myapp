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

  def notify_mail(users)
    mail to: users.map{ |u| u.email },
    subject: "テスト"
  end
end
