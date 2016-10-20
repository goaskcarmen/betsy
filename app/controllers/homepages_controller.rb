class HomepagesController < ApplicationController
  def index
  	@user= User.find_by(id: session[:user_id])
  end

  def show_by_category
  end

  def show_all_products
  end

  def show_by_merchant
  end
end
