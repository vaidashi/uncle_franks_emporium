class Order < ApplicationRecord
  belongs_to :user
  has_many :item_orders
  has_many :items, through: :item_orders
  enum status: ["ordered", "paid", "cancelled", "completed"]

  def self.create_from_items(items, current_user)
    order = Order.create(user_id: current_user.id)
    items.each do |item, quantity|
        quantity.times do
          order.items << item
        end
    end
    order.save
  end


end
