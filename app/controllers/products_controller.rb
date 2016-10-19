class ProductsController < ApplicationController
  before_action :find_product only: [:show, :edit, :update]

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def destroy
  end

  def edit
  end

  def update
    if @product.update(product_params)
     redirect_to product_path
    else
     render :edit
    end
  end

  def show
  end

  private

  def find_product
    @product = Product.find(params[:id].to_i)
  end

  def product_params
    params.require(:product).permit(:name, :description)
  end
end
