class Order < ApplicationRecord
  belongs_to :user
  has_many :item_orders
  has_many :items, through: :item_orders
  enum status: ["ordered", "paid", "cancelled", "completed"]

  scope :ordered, -> { where(status: "ordered")}
  scope :paid, -> { where(status: "paid")}
  scope :cancelled, -> { where(status: "cancelled")}
  scope :completed, -> { where(status: "completed")}

  def self.create_from_items(items, current_user)
    order = Order.create(user_id: current_user.id)
    items.each do |item, quantity|
        quantity.times do
          order.items << item
        end
    end
    order.save
  end

  def total_price
    total_price = 0
      self.items.each do |item|
        total_price += item.price
        end
    total_price
  end


end
