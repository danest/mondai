class UserMailer < ActionMailer::Base
  include Resque::Mailer
  default :from => "mondai@gmail.com"
  
  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Registered")
  end
end
