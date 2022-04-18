class Product < ApplicationRecord

  has_many :user_products
  has_many :users, through: :user_products


  validates :name, presence:true, length: { minimum: 4, maximum: 50 }
  validates :seller, presence:true, length: { minimum: 4, maximum: 50}
  validates :description, length: { minimum: 0, maximum: 150 }
  validates :price, presence:true
end