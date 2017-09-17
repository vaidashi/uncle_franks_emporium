class Admin::DashboardController < Admin::BaseController

  def index
    @all_orders = Order.all
    if params[:order_status] == "completed"
      @orders = Order.completed
      render :layout=>false
    elsif params[:order_status] == "paid"
      @orders = Order.paid
      render :layout=>false
    elsif params[:order_status] == "cancelled"
      @orders = Order.cancelled
      render :layout=>false
    elsif params[:order_status] == "ordered"
      @orders = Order.ordered
      render :layout=>false
    else
      @orders = Order.all
      render :layout=>false
    end
  end

end
