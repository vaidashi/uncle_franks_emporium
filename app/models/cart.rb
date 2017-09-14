class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || Hash.new
  end

  def add_item(id)
    @contents[id.to_s] = (contents[id.to_s] || 0) + 1
  end

  def remove_item(id)
    @contents[id.to_s] = contents[id.to_s] - 1
    if @contents[id.to_s] == 0
      @contents.delete(id.to_s)
    end
  end

  def all_items
    @contents.transform_keys do |item|
      item = Item.find(item.to_i)
    end
  end

  def self.subtotal(item, count)
    item.price * count
  end

  def item_count
    @contents.values.inject(:+)
  end

  def total
    total_price = 0
    all_items.each do |item, count|
      total_price += (item.price * count)
    end
    total_price
  end

end
