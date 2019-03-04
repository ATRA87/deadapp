class OrdersController < ApplicationController
  before_action :set_order, only: [:edit, :update]

  def new
    @order = Order.new(project_params)
    @project_id = params[:project_id]
    authorize @order
  end

  def create
    @project = Project.find(params[:order][:project])
    @order = Order.new(order_params)
    @order.project = @project
    @order.user = current_user
    authorize @order
    @order.save
    redirect_to orders_path
  end

  def index
    @orders = policy_scope(Order).where(user: current_user).order(created_at: :desc)
    @my_projects_orders = current_user.project_orders
  end

  def edit
  end

  def update
    @order.update(order_params)
    redirect_to orders_path
  end

  private

  def set_order
    @order = Order.find(params[:id])
    authorize @order
  end

  def order_params
    params.require(:order).permit(:due_date, :amount, :client_state, :dev_state, :amount)
  end

  def project_params
    params.permit(:project_id)
  end
end
