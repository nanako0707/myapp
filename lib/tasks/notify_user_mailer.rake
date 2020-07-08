namespace :notify_user_mailer do
  desc "未読の手順一覧メールを発行する"
  task notify_user_mail: :environment do
    users = User.all

    users.each do |user|
      SurgicalOperationMailer.notify_user_mail(user, @surgical_operation).deliver
    end
  end
end
