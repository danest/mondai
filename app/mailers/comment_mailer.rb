class CommentMailer < ActionMailer::Base
  default :from => "team@mondai.me"
  def comment_notify(question)
    @user = question.user_id
    @question = question
    mail(:to => @user.email, :subject => "New Answer To Your Question")
  end
end
