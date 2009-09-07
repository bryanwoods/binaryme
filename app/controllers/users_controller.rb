class UsersController < ApplicationController
  before_filter :find_user, :only => [:edit, :update]
  
  def new
    @user = User.new
  end
  
  def edit 
  end
  
  def update
    if @user.update_attributes(params[:user])
      redirect_to edit_user_path(@user)
      flash[:notice] = "Changes saved."
    else
      render :action => 'edit'
    end
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
            # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      self.current_user = @user # !! now logged in
      redirect_back_or_default('/')
      flash[:notice] = "Welcome to BinaryMe, #{current_user.login}."
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end
  
  protected
  
  def find_user
    @user = User.find(params[:id])
  end
end
