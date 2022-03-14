class User < ApplicationRecord
  validates :username, presence :true, length: { minimum: 4, maximum: 15 }
  validates :password, presence :true, length: { minimum: 8, maximum: 20 }
end