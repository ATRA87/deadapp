class OrdersController < ApplicationController

  def index
    @orders = policy_scope(Order)
  end
end
