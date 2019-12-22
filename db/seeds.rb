10.times do
  user = User.create name: FFaker::Name.name
  3.times do
    order = user.orders.create code: SecureRandom.hex
    2.times do
      order.order_locations.create location: FFaker::Address.street_address
    end
    3.times do
      order.bids.create price: rand(100)
    end
  end
end
