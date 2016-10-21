class ReviewsController < ApplicationController

  before_action :find_product, only: [:new, :create, :edit]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # @reivew.product_it = find_product.id
    @review.save
    if @review.save
      redirect_to product_path(@product.id)
    else
      render :template => 'products/show/:id'
    end

  end

  def edit
  end

  def update
  end

  private

  def find_product
    @product = Product.find(params[:product_id].to_i)
  end

  def review_params
    params.require(:review).permit(:rating, :content).merge(user_id: session[:user_id], product_id: @product.id)
    # need to add ", product_id: ____________" in the merge parens in order to associate to a product.
  end

end
