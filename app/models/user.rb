class User < ApplicationRecord

  before_save { self.email = email.downcase }

  has_many :user_products
  has_many :products, through: :user_products
  
  has_secure_password

  validates :username, uniqueness: { case_sensitive: false }, 
    presence: true,
    length: { minimum: 4, maximum: 30 }

  validates :email, uniqueness: { case_sensitive: false }, presence: true, 
    length: { minimum: 6, maximum: 50 }, 
    format: { with: URI::MailTo::EMAIL_REGEXP }
end