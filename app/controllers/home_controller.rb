class HomeController < ApplicationController
  
  before_filter :authenticate_user!, :only => :show 
  
  def index
    if !!current_user
      render :action => 'logged_in_user'
    else
      render :action => 'new_user'
    end
  end

  def show  
    #this is where we want to show their newsfeed of things
    @user_questions = current_user.questions
    @topics = Topic.all
  end
end
