class CartsController < ApplicationController
  before_action :find_product, only: [:create, :edit]

  def create
    if session[:cart_id] == nil
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
    @cart_product = CartProduct.new
    @cart_product.product_quantity = 1
    @cart_product.product_id = @product.id
    @cart_product.cart_id = session[:cart_id]


    puts 'HTHTHTHTHTHTHTHTH'
    puts session[:cart_id]
    redirect_to(:back)
  end

  def edit


    redirect_to(:back)
  end

  def update
  end

  def show
  end

  def destroy
  end

  private
  def user_params
    params.require(:cart_product).permit(:product_quantity, :product_id, :cart_id)
  end

  def find_product
    @product = Product.find(params[:id].to_i)
  end

  def product_params
    params.require(:product).permit(:name, :description, :unit_price, :photo_url, :quantity)
  end
end
