class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || Hash.new
  end

  def add_item(id)
    @contents[id.to_s] = (contents[id.to_s] || 0) + 1
  end

  def all_items
    @contents.transform_keys do |item|
      item = Item.find(item.to_i)
    end
  end

  def total
    total_price = 0
    all_items.each do |item, count|
      total_price += (item.price * count)
    end
    total_price
  end

end
