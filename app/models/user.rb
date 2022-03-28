class User < ApplicationRecord
  has_many :products

  validates :username, uniqueness: true, presence: true, length: {minimum: 4, maximum: 30}
  validates :email, uniqueness: true, presence: true, length: {minimum: 6, maximum: 50}, format: { with: URI::MailTo::EMAIL_REGEXP }
end