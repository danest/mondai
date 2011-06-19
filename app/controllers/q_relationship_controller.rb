class QRelationshipController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :js
  
  def create
    @question = Question.find(params[:relationship][:q_followed_id])
    current_user.follow_question!(@question)
    respond_with @question
  end
  
  def destroy
    @question = QRelationship.find(params[:id]).question_followed
    current_user.unfollow_question!(@question)
    respond_with @question
  end
end