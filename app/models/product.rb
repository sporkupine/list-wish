class Product < ApplicationRecord
  validates :name, presence :true, length: { minimum: 4, maximum: 50 }
  validates :seller, presence :true, length: { minimum: 4, maximum: 50}
  validates :price, presence :true
end