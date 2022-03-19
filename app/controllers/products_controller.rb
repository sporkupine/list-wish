class ProductsController < ApplicationController

  before_action :set_product, only: [:edit, :update, :show, :destroy]

  def show

  end

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
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
    params.require(:product).permit(:name, :price, :seller)
  end

end