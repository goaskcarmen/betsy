class HomepagesController < ApplicationController
  before_action :find_all_product, only: [:index, :show_all_products]
  def index
  	@user= User.find_by(id: session[:user_id])
  end

  def show_by_category
  end

  def show_all_products
  end

  def show_by_merchant
  end

  private
  def find_all_product
    @products = Product.all
  end
end
