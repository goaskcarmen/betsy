class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to index_path
    else
      render :new
    end
  end

  def destroy
    @product.destroy

    if @product.destroy
      redirect_to index_path
    end
  end

  def edit
  end

  def update
    @product.update(product_params)
    if @product.update(product_params)
     redirect_to product_path
    else
     render :edit
    end
  end

  def show
    @product = Product.find(params[:id])
    @review = Review.new
    @reviews = @product.reviews
  end

  private
  def find_product
    @product = Product.find(params[:id].to_i)
  end

  def product_params
    params.require(:product).permit(:name, :description, :unit_price, :photo_url, :quantity).merge(user_id: session[:user_id])
  end

end
