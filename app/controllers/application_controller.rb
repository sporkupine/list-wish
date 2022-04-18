class ApplicationController < ActionController::Base
  def require_user
    if !helpers.logged_in?
      flash[:alert] = "You have to log in to do that!"
      redirect_to login_path
    end
  end

  def require_same_user
    if helpers.current_user != @user && !helpers.current_user.admin?
      flash[:alert] = "You can only edit your own profile!"
      redirect_to @user
    end
  end

end
