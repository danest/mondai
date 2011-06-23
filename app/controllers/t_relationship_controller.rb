class TRelationshipController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :js
  
  def create
    @topic = Topic.find(params[:relationship][:t_followed])
    current_user.follow_topic!(@topic)
    respond_with @topic
  end
  
  def destroy
    @topic = TRelationship.find(params[:id]).topic_name
    current_user.unfollow_topic!(@topic)
    respond_with @topic
  end
end