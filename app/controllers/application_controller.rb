class ApplicationController < ActionController::Base
  def require_user
    if !helpers.logged_in?
      flash[:notice] = "You have to log in to do that!"
      redirect_to login_path
    end
  end

  # def require_same_user

  # end

  # def add_product
  #   if !helper.logged_in?
  #     flash[:notice] = "You have to log in to do that!"
  #     redirect_to login_path
  #   else
  #     user.products.
  #                   ^ whatever function we use to add products to fav lists
  #                     will go here
  #   end
  # end
end
