class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
  end

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params.require(:product).permit(:name, :price, :seller))
    if @product.save
      flash[:notice] = "Product saved!"
      redirect_to @product
    else
      render 'new'
    end
  end
end