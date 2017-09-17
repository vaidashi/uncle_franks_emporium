class User < ApplicationRecord
  has_secure_password
  has_many :orders
  enum role: ["user", "admin"]

  validates :username, presence: :true, uniqueness: :true
  validates :password, presence: :true

  def address
    "#{self.street}, #{self.city}, #{self.state}, #{self.zip_code}, #{self.country}"
  end
end
