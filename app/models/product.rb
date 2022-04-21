class Product < ApplicationRecord

  has_many :user_products
  has_many :users, through: :user_products

  has_many :product_categories
  has_many :categories, through: :product_categories


  validates :name, presence:true, length: { minimum: 4, maximum: 75 }
  validates :seller, presence:true, length: { minimum: 4, maximum: 50}
  validates :description, length: { minimum: 0, maximum: 300 }
  validates :price, presence:true
end