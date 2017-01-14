class Item < ActiveRecord::Base
  belongs_to :business

  validates :name,  presence: true, length: { maximum: 150 }
  validates :price,  presence: true, numericality: { only_integer: true }
end
