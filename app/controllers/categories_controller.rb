

class CategoriesController < ApplicationController

  def show
    @category = Category.find_by(name: params[:category_name])
    @items = @category.items
  end

end
