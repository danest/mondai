class TopicsController < ApplicationController
  
  def show
    @topic = Topic.find(params[:id])
    respond_to do |format|
       format.html # show.html.erb
       format.xml  { render :xml => @topic }
     end
  end
  
  
end