namespace :notify_user_mailer do
  desc "挨拶するメールを発行する"
  task notify_user_mail: :environment do
    users = User.all

    users.each do |user|
      SurgicalOperationMailer.notify_user_mail(user).deliver
    end
  end
end
