
class OrdersController < ApplicationController
  before_action :require_current_user, only: [:index]
  before_action :current_admin?, only: [:cancel, :paid, :completed]

  def index
    if current_user
      @orders = Order.where(user_id: current_user.id).order(id: :desc)
    else
      redirect_to login_path
    end
  end

  def show
    @order = Order.find(params[:id] )
    render file: "/public/404" unless (current_user == @order.user)
  end

  def create
    items = @cart.all_items
    if @cart.contents.empty?
      flash[:bad_message] = "CART EMPTY FILL IT WITH GARBAGE"
      redirect_back(fallback_location: root_path)
    else
    order = Order.create_from_items(items, current_user)
    flash[:good_message] = "Order was successfully placed"
    session.delete(:cart)
    redirect_to orders_path
    end
  end

  def cancel
    Order.update(params[:order_id], status: "cancelled")
    redirect_back(fallback_location: root_path)
  end

  def paid
    Order.update(params[:order_id], status: "paid")
    redirect_back(fallback_location: root_path)
  end

  def completed
    Order.update(params[:order_id], status: "completed")
    redirect_back(fallback_location: root_path)
  end

end
