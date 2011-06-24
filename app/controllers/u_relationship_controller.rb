class URelationshipController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :js
  
  def create
    @user = User.find(params[:relationship][:u_followed_id])
    current_user.follow_user!(@user)
    respond_with @user
  end
  
  def destroy
    @user = URelationship.find(params[:id]).user_followed
    current_user.unfollow_user!(@user)
    respond_with @user
  end
  
end