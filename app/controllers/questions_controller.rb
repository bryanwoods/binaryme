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
  end
  
  def activate
    @question = Question.find(params[:id])
    @question.activate
    redirect_to questions_path
    flash[:notice] = "Question activated."
  end

end
