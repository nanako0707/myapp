class ApplicationMailer < ActionMailer::Base
  default from: ENV['SENDGRID_DOMAIN']
  layout 'mailer'
end
