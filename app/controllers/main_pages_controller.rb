class MainPagesController < ApplicationController
  def home
    if logged_in?
      current_user.refresh_questions
    end
  end

  def about
  end

end
