class QuestionsController < ApplicationController
  #before_filter :authenticate, :only => [:create, :destroy] 
  #before_filter :authorized_user, :only => :destroy 
  
  # Need to discuss before us to implement these 2 funcs 
   before_filter :authenticate_user!, :only => :new 
  def new
    @question = Question.new
  end
  def create
    @question = current_user.questions.create(params[:question])
    if @question.save
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def destroy
    
  end
  
  
  #Allowing admin to delete question
  private
    def authorized_user
      @question = Question.find(params[:id])
      redirect_to root_path unless current_user?(@question.user)
    end
  
end