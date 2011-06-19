class HomeController < ApplicationController
  
  before_filter :authenticate_user!, :only => :show 
  
  def index
  end

  def show  
    @user_questions = current_user.questions
    @topics = Topic.all
  end
end
