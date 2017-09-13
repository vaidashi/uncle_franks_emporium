class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def index
    @items = @cart.all_items
    @total = @cart.total
  end

  def update
    item = Item.find(params[:id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    flash[:notice] = "Successfully added a #{item.name} to your cart."
    redirect_to cart_path
  end

  def create
    item = Item.find(params[:item_id])

    @cart.add_item(item.id)
    session[:cart] = @cart.contents

    flash[:notice] = "Successfully added #{item.name}."

    redirect_to item_path(item)
  end

  def destroy
    item = Item.find(params[:id])
    @cart.remove_item(item.id)
    session[:cart] = @cart.contents
    item_link = "<%= link_to item.name, item_path(item) %>"
    flash[:remove_item] = %Q[Successfully removed <a href="#{item_path(item)}"> #{item.name} </a> from your cart].html_safe
    redirect_to cart_path
  end
end
