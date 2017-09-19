class Item < ApplicationRecord
  belongs_to :category
  has_many :item_orders
  has_many :orders, through: :item_orders

  validates :name, presence: :true, uniqueness: :true
  validates :description, :price, presence: :true

  def self.random_item
    find(rand(1..12))
  end
end
