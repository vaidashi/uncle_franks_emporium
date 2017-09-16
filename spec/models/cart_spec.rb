require 'rails_helper'

RSpec.describe Cart do
  describe "Instance Methods" do
    it "adds an item" do
      item = create(:item)

      cart = Cart.new({})

      cart.add_item(item.id)

      expect(cart.contents.count).to eq(1)
    end

    it "removes an item" do
      item = create(:item)
      cart = Cart.new({})
      cart.add_item(item.id)

      expect(cart.contents.count).to eq(1)

      cart.remove_item(item.id)

      expect(cart.contents.count).to eq(0)
    end

    it "returns all items in cart" do
      item1 = create(:item)
      item2 = create(:item)
      cart = Cart.new({})
      cart.add_item(item1.id)
      cart.add_item(item2.id)


      expect(cart.all_items.first[0].id).to eq(item1.id)
      expect(cart.all_items.keys.last.id).to eq(item2.id)
    end

    it "returns item count" do
      item1 = create(:item)
      item2 = create(:item)
      cart = Cart.new({})
      cart.add_item(item1.id)
      cart.add_item(item2.id)

      expect(cart.item_count).to eq(2)
    end

    it "returns total" do
      item1 = create(:item)
      item2 = create(:item)
      cart = Cart.new({})
      cart.add_item(item1.id)
      cart.add_item(item2.id)

      expect(cart.total).to eq(100.0)
    end

  describe "Class Methods" do
    it "returns the subtotal" do
      item1 = create(:item)
      item2 = create(:item)
      cart = Cart.new({})
      cart.add_item(item1.id)
      cart.add_item(item1.id)
      cart.add_item(item2.id)

      expect(Cart.subtotal(item1, 2)).to eq(100.0)
    end

  end






  end



end
