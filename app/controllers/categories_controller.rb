class CategoriesController < ApplicationController

  before_action :require_admin, except: [:index, :show]

  def index
    @categories = Category.paginate(page: params[:page], per_page: 8 )
  end

  def show
    @category = Category.find(params[:id])
    @products = @category.products.paginate(page: params[:page], per_page: 4)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category created!"
      redirect_to @category
    else
      flash[:alert] = "Category creation failed!"
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = "Category updated successfully."
      redirect_to @category
    else
      render 'edit'
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

  def require_admin
    if !(helpers.logged_in? && helpers.current_user.admin?)
      flash[:alert] = "Only admins can do that!"
      redirect_to categories_path
    end
  end


end