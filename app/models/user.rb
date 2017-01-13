class User < ActiveRecord::Base

  before_save { self.email = email.downcase }

  has_secure_password

  has_one :business

  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :first_name,  presence: true
  validates :last_name,  presence: true
  validates :email, presence: true, format: { with: VALID_EMAIL }, uniqueness: { case_sensitive: false } 
  validates :password, presence: true, length: { minimum: 6 }
end
