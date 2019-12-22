class Order < ApplicationRecord
  belongs_to :user
  has_many :order_locations, dependent: :destroy
  has_many :bids, dependent: :destroy
end
