class Business < ActiveRecord::Base
  belongs_to :user

  has_many :items

  validates :name,  presence: true
  validates :address,  presence: true
  validates :city,  presence: true
  validates :user_id,  presence: true
end
