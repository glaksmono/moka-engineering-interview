class User < ActiveRecord::Base

  has_secure_password

  has_one :business

  accepts_nested_attributes_for :business

  validates :first_name,  presence: true
  validates :last_name,  presence: true
  validates :email, presence: true
end
