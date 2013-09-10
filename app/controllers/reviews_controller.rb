class ReviewsController < ApplicationController
  before_action :ensure_logged_in, only: [:edit, :create, :show, :update, :destroy]
	before_action :load_product

  def show
  	@review = Review.find(params[:id])
  end

  def create
  	@review = @product.reviews.build(review_params)
  	@review.user_id = current_user.id

  	if @review.save
  		redirect_to @product, notice: 'Review successfully created'
  	else
  		render action: :show, alert: 'Problem saving your review'
  	end

  end

  def destroy
  	@review = Review.find(params[:id])
  	@review.destroy
    redirect_to @product
  end


  private

  def load_product
  	@product = Product.find(params[:product_id])
  end

  def review_params
  	params.require(:review).permit(:comment)
  end
end
