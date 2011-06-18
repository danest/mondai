class UsersController < ApplicationController
  def new
  end
  
  #This will be use when we render the page for each user in both profile and question page.
  def user_following
    show_user_follow(:user_following)
  end
  
  def user_followers
    show_user_follow(:user_followers)
  end
  
  def show_user_follow(action)
    @title = action.to_s.capitalize
    @user = User.find(params[:id])
    @users = @user.send(action).paginate(:page => params[:page])
    render 'show_user_follow'
  end
end
