namespace :unreading_mailer do
  desc "未読の手順一覧メールを発行する"
  task unreading_mail: :environment do
    users = User.all

    users.each do |user|
      SurgicalOperationMailer.unreading_mail(user, @surgical_operation).deliver
    end
  end
end
