class Item < ActiveRecord::Base
  belongs_to :business

  validates :business, presence: true
  validates :name, presence: true
  validates :price, numericality: { greater_than: 0 }
end
