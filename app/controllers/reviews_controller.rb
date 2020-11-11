class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new()
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(strong_params)
    @restaurant.reviews << @review
    @restaurant.save
    redirect_to restaurant_path(@restaurant)
  end

  private
  def strong_params
    params.require(:review).permit(:rating, :content)
  end
end
