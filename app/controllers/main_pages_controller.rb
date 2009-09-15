class MainPagesController < ApplicationController
  def home
    find_questions_for_current_user_type 
  end

  def about
  end
end
