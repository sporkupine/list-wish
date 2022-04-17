class ProductsController < ApplicationController

  before_action :set_product, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def show

  end

  def index
    @products = Product.paginate(page: params[:page], per_page: 8)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      helpers.current_user.products << @product
      flash[:notice] = "Product saved!"
      redirect_to @product
    else
      render 'new'
    end
  end

  def edit
  
  end
  
  def update
    if @product.update(product_params)
      flash[:notice] = "Product updated!"
      redirect_to @product
    else
      render 'edit'
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :seller, :img_path)
  end

end