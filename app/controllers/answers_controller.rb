class AnswersController < ApplicationController
  #before_filter :authenticate, :only => [:create, :destroy] 
  #before_filter :authorized_user, :only => :destroy 
  
  # Need to discuss before us to implement these 2 funcs
  before_filter :authenticate_user!
  def new
    @answer = Answer.new  
  end
  
  
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(params[:answer])
    @answer.user = current_user
    respond_to do |format|
      if @answer.save
        format.html { redirect_to show_question_path(@answer.question.normalized_name,@answer.question) }
        format.js
        CommentMailer.comment_notify(@question).deliver        
      else
        render 'new'
      end
    end
  end
  
  def edit
    @answer = Answer.find(params[:id])
  end
  
  def update
    @answer = Answer.find(params[:id])
    respond_to do |format|
      if @answer.update_attributes(params[:answer])
        format.html { redirect_to(session[:return_to],
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
      format.js
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
    if vote(:for, current_user, @answer)
      @answer.update_attributes(:count => (@answer.count+=1)) 
      #@answer.save
      flash[:notice] = "Thank you for voting"
      respond_to do |format|
        format.html { redirect_to show_question_path(@answer.question.normalized_name,@answer.question) }
        format.js
      end
    else
      flash[:notice] = "Your vote has already been registered"
      respond_to do |format|
        format.html { redirect_to show_question_path(@answer.question.normalized_name,@answer.question) }
        format.js
      end
    end
  end
  
  def vote_down
    @answer = Answer.find(params[:answer_id])
    if vote(:against, current_user, @answer)
      flash[:notice] = "Thank you for voting"
      @answer.update_attributes(:count => (@answer.count-=1)) 
      respond_to do |format|
        format.html { redirect_to show_question_path(@answer.question.normalized_name,@answer.question) }
        format.js
      end
    else
      flash[:notice] = "Your vote has already been registered"
      respond_to do |format|
        format.html { redirect_to show_question_path(@answer.question.normalized_name,@answer.question) }
        format.js
      end
    end
  end
   
  #Allowing admin to delete answer
  private
    def vote(value, user, answer)
      new_vote = false
      #find vote for this instance by the given user OR create a new one
      vote = answer.votes.where(:user_id => current_user.id).first || answer.votes.create(:user_id => current_user.id)

      if value == :for
        vote_value = 1
      elsif value == :against
        vote_value = -1
      end

      if vote.value != vote_value
        vote.value = vote_value
        vote.save
        new_vote = true
      end
      
      return new_vote
    end
    
    def authorized_user
      @answer = Answer.find(params[:id])
      redirect_to root_path unless current_user?(@answer.user)
    end
end
