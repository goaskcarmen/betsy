class HomepagesController < ApplicationController
  before_action :find_all_product, only: [:index, :show_all_products, :show_by_merchant, :show_all_products]

  def index
  	@user= User.find_by(id: session[:user_id])
    @users = User.all
    @categories = Category.all
  end

  def show_by_category
    @cat_products = Category.find(params[:id].to_i).products
    @cat = Category.find(params[:id].to_i)

    if @cat_products == nil
      redirect_to index_path
    end
  end

  def show_all_products
  end

  def show_by_merchant
# <<<<<<< HEAD
    # @merchant_products = @products.where(user_id: params[:id])
    #
    # if @merchant_products == nil
    #   redirect_to index_path
    # end
# =======
    @merchant_products = @products.where(user_id: params[:id])
    @user= User.find_by(id: session[:user_id])

    #if merchant_products is nil then they didn't get to this page through the form,
    # that means they got here through merchant account page, so show this merchant's products
    @merchant_products = @user.products if @merchant_products.empty?
  end

  private
  def find_all_product
    @products = Product.all
  end
end
