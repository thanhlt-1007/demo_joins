class User < ApplicationRecord
  has_many :orders, dependent: :destroy

  scope :order_order_location_bid, (lambda do
    order_location_ids = Order.includes(:order_locations).map(&:order_location_ids)
    min_order_location_ids = order_location_ids.map(&:min).join(", ")
    max_order_location_ids = order_location_ids.map(&:max).join(", ")

    joins(:orders)
      .joins("INNER JOIN order_locations order_locations_1
        ON order_locations_1.order_id == orders.id
          AND order_locations_1.id IN (#{min_order_location_ids})")
      .joins("INNER JOIN order_locations order_locations_2
        ON order_locations_2.order_id == orders.id
        AND order_locations_2.id IN (#{max_order_location_ids})")
      .joins("INNER JOIN bids
        ON bids.order_id == orders.id")
  end)
end
