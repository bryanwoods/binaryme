class QuestionsController < ApplicationController
  before_filter :find_question, :only => [:activate, :deactivate]
  
  def index
    find_questions_for_current_user_type 
  end

  def show
  end

  def edit
  end

  def new
    @question = Question.new
  end
  
  def create
    @question = Question.create!(params[:question])
    if current_user.curator
      @question.activate
      @question.save
    else
      @question.save
    end
    
    redirect_to questions_path
    flash[:notice] = "Question added successfully."
  end
    
  def activate
    @question.activate
    redirect_to questions_path
    flash[:notice] = flash_question_state(@question.state)
  end
  
  def deactivate
    @question.deactivate
    redirect_to questions_path
    flash[:notice] = flash_question_state(@question.state)
  end
  
  protected
  
  def find_question
    @question = Question.find(params[:id])
  end
  
  def flash_question_state(state)
    if state == "inactive"
      "Question deactivated."
    else
      "Question activated."
    end
  end
end
