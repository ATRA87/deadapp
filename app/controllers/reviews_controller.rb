class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]
  before_action :set_review_order

  def new
    @review = Review.new
    @order = Order.find(params[order_id])
  end

  def create
    @review = Review.new
    @review.communication_rating = params['communication_rating']
    @review.quality_rating = params['quality_rating']
    @review.delivery_on_time_rating = params['delivery_on_time_rating']

    orders = []
    project = @review.order.project
    Order.where(user: current_user).where(project: project) do |o|
      orders << o if o.review.nil?
    end
    @order = orders.first
    authorize @order unless @order.nil?

    if @review.save
      respond_to do |format|
        format.html { redirect_to @order}
        format.js # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render project } # or 'project/show' or 'projects/show'? cf corental
        format.js # <-- idem
      end
    end
  end

  private

  def set_review_order
    @review.order = @order
    authorize @review
  end

  def review_params
    params.require(review).permit(:communication_rating, :quality_rating, :delivery_on_time_rating, :content)
  end
end
