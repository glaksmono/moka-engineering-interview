class Business < ActiveRecord::Base
  belongs_to :user

  has_many :items, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
end
