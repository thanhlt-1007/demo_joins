class CreateBids < ActiveRecord::Migration[5.2]
  def change
    create_table :bids do |t|
      t.references :order, foreign_key: true
      t.integer :price

      t.timestamps
    end
  end
end
