class CreateBookingItems < ActiveRecord::Migration[5.0]
  def change
    create_table :booking_items do |t|
      t.references :booking, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
