class AnswersController < ApplicationController
  #before_filter :authenticate, :only => [:create, :destroy] 
  #before_filter :authorized_user, :only => :destroy 
  
  # Need to discuss before us to implement these 2 funcs
  before_filter :authenticate_user!, :only => :new 
  def new
    @answer = Answer.new  
  end
  
  
def create
    @answer = current_user.answer.create(params[:answer])
    if @question.save
      redirect_to home_show_path
    else
      render 'new'
    end
  end
  
  def edit
    @answer = Answer.find(params[:id])
  end
  
  def update
    @answer = Answer.find(params[:id])

    respond_to do |format|
      if @answer.update_attributes(params[:answer])
        format.html { redirect_to(@answer,
                      :notice => 'Answer was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @answer.errors,
                      :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy

    respond_to do |format|
      format.html { redirect_to(home_show_path) }
      format.xml  { head :ok }
    end
  end
  
  def show
    @question = Question.find(params[:id])
    respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @post }
    end
  end  
  #Allowing admin to delete answer
  private
    def authorized_user
      @answer = Answer.find(params[:id])
      redirect_to root_path unless current_user?(@answer.user)
    end
  
end