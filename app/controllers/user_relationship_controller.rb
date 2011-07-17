class UserRelationshipController < ApplicationController
  before_filter :authenticate
  respond_to :html, :js
  
  def create
    @user = User.find(params[:relationship][:user_followed_id])
    current_user.follow_user!(@user)
    respond_with @user
  end
  
  def destroy
    @user = UserRelationship.find(params[:id]).user_followed
    current_user.unfollow_user!(@user)
    respond_with @user
  end
end