class Item < ApplicationRecord
  belongs_to :category
  has_many :item_orders
  has_many :orders, through: :item_orders

  validates :name, presence: :true, uniqueness: :true
  validates :description, presence: :true
  validates :price, presence: :true
  # validates :image_path, presence: :true
end
