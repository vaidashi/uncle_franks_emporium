require 'rails_helper'

RSpec.describe Item, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :price }
    it { is_expected.to validate_numericality_of :price }
  end

  context "associations" do
    it { should have_many :item_orders }
    it { should have_many(:orders).through(:item_orders) }
  end

  context "Class Methods" do
    it "::can returns random items" do
    x = 1
    category = create(:category)

      12.times do
        Item.create(id: x, name: "couch#{x}", description: "The thing", price: 5.00, category: category)
        x += 1
      end

    item = Item.random_item

    expect(item.class).to eq(Item)
    end
  end

  context "Instance Methods" do
    it "::can return item subtotal" do
      user = create(:user_with_orders)
      item1 = create(:item)

      user.orders.first.items << [item1, item1]

      expect(user.orders.first.item_subtotal(item1.id)).to eq(100.0)
    end
  end

end
