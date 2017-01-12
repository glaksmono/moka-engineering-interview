class Item < ActiveRecord::Base
  belongs_to :business

  validates :name,  presence: true
  validates :price,  presence: true
  validates :business_id,  presence: true
end
