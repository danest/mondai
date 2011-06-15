class AnswersController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy] 
  before_filter :authorized_user, :only => :destroy 
  
  # Need to discuss before us to implement these 2 funcs 
  def create
  
  end
  
  def destroy
  end
  
  #Allowing admin to delete answer
  private
    def authorized_user
      @answer = Answer.find(params[:id])
      redirect_to root_path unless current_user?(@answer.user)
    end
  
end