class Admin::DashboardController < Admin::BaseController

  def index
    @all_orders = Order.all
    if params[:order_status] == "all"
      @orders = Order.all
    elsif params[:order_status] == "completed"
      @orders = Order.completed
    elsif params[:order_status] == "paid"
      @orders = Order.paid
    elsif params[:order_status] == "cancelled"
      @orders = Order.cancelled
    elsif params[:order_status] == "ordered"
      @orders = Order.ordered
    else
      @orders = Order.all
    end
  end

end
