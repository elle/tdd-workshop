class ApplicationMailer < ActionMailer::Base
  default from: ENV.fetch("DEFAULT_EMAIL")
  layout "mailer"
end
