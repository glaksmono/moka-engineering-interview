class Business < ActiveRecord::Base
  belongs_to :user

  has_many :items

  validates :name,  presence: true, length: { maximum: 150 }
  validates :address,  presence: true
  validates :city,  presence: true, length: { maximum: 150 }

end
