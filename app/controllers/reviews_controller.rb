class ReviewsController < ApplicationController

  before_action :find_product, only: [:new, :create, :edit, :destroy]
  before_action :find_review, only: [:edit, :destroy]
  # def new
  #   @review = Review.new
  # end

  def create
    @review = Review.new(review_params)
    @review.save
    if @review.user_id == @product.user_id
      flash[:notice] = " 🕵🏻 We have our eyes on you.. you can't review your own product!"
      @review.destroy
    end
    if @review.id
      redirect_to product_path(@product.id)
    else
      render :template => 'products/show/:id'
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @review.destroy
    if @review.destroy
      redirect_to product_path(@product.id)
    end
  end


  private

  def find_product
    @product = Product.find(params[:product_id].to_i)
  end

  def find_review
    @review = Review.find(params[:id].to_i)
  end

  def review_params
    params.require(:review).permit(:rating, :content).merge(user_id: session[:user_id], product_id: @product.id)
    # need to add ", product_id: ____________" in the merge parens in order to associate to a product.
  end

end
