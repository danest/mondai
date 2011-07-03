class AnswersController < ApplicationController
  #before_filter :authenticate, :only => [:create, :destroy] 
  #before_filter :authorized_user, :only => :destroy 
  
  # Need to discuss before us to implement these 2 funcs
  before_filter :authenticate_user!, :only => :new 
  def new
    @answer = Answer.new  
  end
  
  
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(params[:answer])
    @answer.user = current_user
    if @answer.save
      redirect_to show_question_path(@answer.question.normalized_name,@answer.question)
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
      format.html { redirect_to(show_question_path(Question.find(params[:question_id]).normalized_name, params[:question_id],)) }
      format.xml  { head :ok }
    end
  end
  
  def show
    @answer = Answer.find(params[:id])
    respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @post }
    end
  end 
  
  def vote_up
    @answer = Answer.find(params[:answer_id])
    @answer.count += 1
    if @answer.save
      redirect_to show_question_path(@answer.question.normalized_name,@answer.question)
    else
      flash[:notice] = "Error Voting Please Try Again"
      redirect_to show_question_path(@answer.question.normalized_name,@answer.question)
    end
  end
  
  def vote_down
     @answer = Answer.find(params[:answer_id])
      @answer.count -= 1
      if @answer.save
        redirect_to show_question_path(@answer.question.normalized_name,@answer.question)
      else
        flash[:notice] = "Error Voting Please Try Again"
        redirect_to show_question_path(@answer.question.normalized_name,@answer.question)
      end
  end 
  #Allowing admin to delete answer
  private
    def authorized_user
      @answer = Answer.find(params[:id])
      redirect_to root_path unless current_user?(@answer.user)
    end
  
end