class HomeController < ApplicationController
  
  before_filter :authenticate_user!, :only => :show 
  before_filter :store_location
  
  def index
    if !!current_user
      #show news feed or popular questions
      @questions = Question.page(params[:page]).per(10)
      @topics = Topic.all  
      render :action => 'logged_in_user'
    else
      render :action => 'new_user'
    end
  end

  def yc
    @questions = Question.page(params[:page]).per(10)
    @topics = Topic.all  
    render :action => 'logged_in_user'
  end

  def show
    #@questions = Question.all
    redirect_to root_path  
  end
  
  def search
    @questions = Question.search(params[:search]).page(params[:page]).per(10)
  end
end
