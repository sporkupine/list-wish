class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update, :show, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @users = User.paginate(page: params[:page], per_page: 8)
  end

  def show
    @products = @user.products.paginate(page: params[:page], per_page: 4)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save 
      session[:user_id] = @user.id
      flash[:notice] = "Account created successfully. Welcome to WishList, #{@user.username}!"
      redirect_to @user
    else
        render :new
    end
  end

  def edit
    
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Account updated successfully."
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      session[:user_id] = nil
      flash[:notice] = 'User was successfully deleted.'
      redirect_to users_path
    else
      flash[:alert] = 'Something went wrong!'
      redirect_to user_path(@user)
    end
  end
  

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end