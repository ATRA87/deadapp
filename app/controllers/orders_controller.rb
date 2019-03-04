class OrdersController < ApplicationController
  def new
    @order = Order.new
    authorize @order
  end

  def create
    @project = Project.find(params[:project_id])
    @order = Order.new(project: @project, user: current_user, price: 1000)
    authorize @order
    redirect_to @project if @order.save
  end

  def index
    @orders = policy_scope(Order)
  end
end
