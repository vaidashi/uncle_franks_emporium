class CartsController < ApplicationController

  def index
    @items = @cart.all_items
    @total = @cart.total
  end

  def create
    item = Item.find(params[:item_id])

    @cart.add_item(item.id)
    session[:cart] = @cart.contents

    flash[:notice] = "Successfully added #{item.name}."

    redirect_to item_path(item)
  end
end
