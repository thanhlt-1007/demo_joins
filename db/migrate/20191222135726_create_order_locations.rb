class CreateOrderLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :order_locations do |t|
      t.references :order, foreign_key: true
      t.string :location

      t.timestamps
    end
  end
end
