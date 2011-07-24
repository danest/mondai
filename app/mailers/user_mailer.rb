class UserMailer < ActionMailer::Base
  include Resque::Mailer
  default :from => "team@mondai.me"
  
  def registration_confirmation(user_id)
    @user = User.find(user_id)
    mail(:to => @user.email, :subject => "Welcome To Mondai.Me")
  end
end
