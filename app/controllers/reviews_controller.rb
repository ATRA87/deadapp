class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]
  before_action :set_order

  def new
    @review = Review.new
  end

  def create
    @review = Review.new
    @review.communication_rating = params['communication_rating']
    @review.quality_rating = params['quality_rating']
    @review.delivery_on_time_rating = params['delivery_on_time_rating']

    orders = []
    project = @review.order.project

  end

  private

  def set_order
    @order = Order.find(params[order_id])
    @review.order = @order
    authorize @review
  end

  def review_params
    params.require(review).permit(:communication_rating, :quality_rating, :delivery_on_time_rating, :content)
  end
end
