class OrdersController < ApplicationController

  def index
    @orders_as_client = current_user.orders
    @orders_as_owner = current_user.project_orders
  end
end
