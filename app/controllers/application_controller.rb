class ApplicationController < ActionController::Base
  def require_user
    if !helpers.logged_in?
      flash[:notice] = "You have to log in to do that!"
      redirect_to login_path
    end
  end

  # def require_same_user

  # end
end
