class BookingItem < ApplicationRecord
  belongs_to :booking, optional: true
  belongs_to :product

  validates :product_id, :quantity, presence: true
end
