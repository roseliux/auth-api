class ApplicationMailer < ActionMailer::Base
  default from: ENV['gmail_mail']
  layout 'mailer'
end
