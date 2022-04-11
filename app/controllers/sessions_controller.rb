class SessionsController < ApplicationController
  
  def new

  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Login Successful"
      redirect_to user
    else
      flash[:notice] = "Login Attempt Failed"
      render :new
    end
  end

  def destroy
   
  end
end