class QuestionsController < ApplicationController
  #before_filter :authenticate, :only => [:create, :destroy] 
  #before_filter :authorized_user, :only => :destroy 
  
  # Need to discuss before us to implement these 2 funcs 
  before_filter :authenticate_user!, :only => :new 
  def new
    @question = Question.new
  end
  
  def create
    @question = current_user.questions.create(params[:question])
    #@question.topics.build(params[:topics])
    if @question.save
      #@question.topics.build(params[:topics])
      redirect_to home_show_path
    else
      render 'new'
    end
  end
  
  def edit
    @question = Question.find(params[:id])
  end
  
  def update
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to(@question,
                      :notice => 'Question was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @question.errors,
                      :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @question = Question.find(params[:id])
    @question.destroy

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
  
  
  
  #Allowing admin to delete question
  private
    def authorized_user
      @question = Question.find(params[:id])
      redirect_to root_path unless current_user?(@question.user)
    end
  
end