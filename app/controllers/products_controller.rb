class ProductsController < ApplicationController

  require 'faraday'
  require 'faraday/net_http'
  Faraday.default_adapter = :net_http



  before_action :set_product, only: [:edit, :update, :show, :destroy, :add_product, :remove_product ]
  before_action :require_user, except: [:show, :index]

  def show

  end

  def index
    @connection = Faraday.new(
      url:'https://fakestoreapi.com/'
    )
    @response = @connection.get('/products')
      
  
    @fake_products = JSON.parse(@response.body)
    @fake_products.each do |product|
      @new_prod = Product.new(
        name: product["title"],
        price: product["price"],
        description: product["description"],
        img_path: product["image"],
        seller: ["Amazon", "Wal-Mart", "Umbrella Corp.", "Skynet"].sample
      )
      @new_prod.save unless (Product.all.select {|product| product.name == @new_prod.name} != [] )
    end
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
    params.require(:product).permit(:name, :price, :seller, :description, :img_path)
  end

end