class ProductsController < ApplicationController

  before_action :set_product, only: [:edit, :update, :show, :destroy, :add_product, :remove_product ]
  before_action :require_user, except: [:show, :index]

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

  
  def add_product
    helpers.current_user.products << @product
    flash[:notice] = 'Product added to your list!'
    redirect_to helpers.current_user
  end
  
  def remove_product
    helpers.current_user.products.delete(@product.id)
    flash[:alert] = 'Successfully deleted from your list.'
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