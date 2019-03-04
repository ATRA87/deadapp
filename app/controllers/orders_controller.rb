class OrdersController < ApplicationController
  def new
    @order = Order.new
    authorize @order
  end

  def create
    @project = Project.find(params[:project_id])
    @order = Order.new(project: @project, user: current_user, amount: 1000)
    authorize @order
    @order.save
    redirect_to new_order_payment_path(@order)
  end

  def index
    @orders = policy_scope(Order).order(state: :desc)
  end
end
