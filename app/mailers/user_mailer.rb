class UserMailer < ActionMailer::Base
  include Resque::Mailer
  default :from => "mondai@gmail.com"
  
  def registration_confirmation(user_id)
    @user = User.find(user_id)
    mail(:to => "#{@user.name} <#{@user.email}>", :subject => "Registered")
  end
end
