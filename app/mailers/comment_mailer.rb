class CommentMailer < ActionMailer::Base
  default :from => "team@mondai.me"
  def comment_notify(question)
    @user = User.find(question.user_id)
    @question = question
    mail(:to => @user.email, :subject => "New Answer To Your Question \"#{@question.content}\"")
  end
end
