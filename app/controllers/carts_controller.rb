class CartsController < ApplicationController
  def create
    item = Item.find(params[:item_id])
    flash[:notice] = "Successfully added #{item.name}."
    redirect_to root_path
  end
end
