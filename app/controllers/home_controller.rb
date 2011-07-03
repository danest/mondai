class HomeController < ApplicationController
  
  before_filter :authenticate_user!, :only => :show 
  
  def index
    if !!current_user
      #show news feed or popular questions
      @questions = Question.all  
      render :action => 'logged_in_user'
    else
      render :action => 'new_user'
    end
  end

  def show
    @questions = Question.all  
  end
  
  def search
    @questions = Question.search(params[:search])
  end
end
