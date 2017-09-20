require 'rails_helper'

RSpec.describe Item, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :price }
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

end
