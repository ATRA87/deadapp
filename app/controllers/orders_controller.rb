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
    redirect_to orders_path
  end

  def index
    @orders = policy_scope(Order).where(user: current_user).order(client_state: :desc)
    @my_projects_orders = current_user.project_orders
  end
end
