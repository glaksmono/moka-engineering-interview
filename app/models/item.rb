class Item < ActiveRecord::Base
  belongs_to :business

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0.0 }
end
