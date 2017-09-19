class WelcomeController < ApplicationController
  def index
    @item1 = Item.first
    @item2 = Item.second
    @item3 = Item.third
  end
end
