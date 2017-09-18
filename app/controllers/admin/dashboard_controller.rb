class Admin::DashboardController < Admin::BaseController

  def index
    @all_orders = Order.all
    if params[:order_status] == "all"
      @orders = Order.all.sort
    elsif params[:order_status] == "completed"
      @orders = Order.completed.sort
    elsif params[:order_status] == "paid"
      @orders = Order.paid.sort
    elsif params[:order_status] == "cancelled"
      @orders = Order.cancelled.sort
    elsif params[:order_status] == "ordered"
      @orders = Order.ordered.sort
    else
      @orders = Order.all
    end
  end

end
