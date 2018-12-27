class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.datetime :date
      t.datetime :email_sent_at
      t.integer :total_quantity

      t.timestamps
    end
  end
end
