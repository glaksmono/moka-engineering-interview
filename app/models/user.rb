class User < ActiveRecord::Base

  has_secure_password

  has_one :business

  accepts_nested_attributes_for :business

  validates :first_name,  presence: true, length: { maximum: 150 }
  validates :last_name,  presence: true, length: { maximum: 150 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
end
