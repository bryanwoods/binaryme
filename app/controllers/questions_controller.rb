class QuestionsController < ApplicationController
  def index
    if current_user.curator
      @questions = Question.all
    else
      @questions = Question.with_state(:active)
    end
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
    @question = Question.find(params[:id])
    @question.activate
    redirect_to questions_path
    flash[:notice] = "Question activated."
  end
  
  def deactivate
    @question = Question.find(params[:id])
    @question.deactivate
    redirect_to questions_path
    flash[:notice] = "Question deactivated."
  end
end
