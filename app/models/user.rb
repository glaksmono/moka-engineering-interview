class User < ActiveRecord::Base

  has_secure_password

  has_one :business

  validates :first_name,  presence: true
  validates :last_name,  presence: true
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, uniqueness: true
end
