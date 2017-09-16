
class OrdersController < ApplicationController
  before_action :require_current_user, only: [:index]

  def index
    if current_user
      @orders = Order.where(user_id: current_user.id)
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
    redirect_to orders_path
    end
  end

end
