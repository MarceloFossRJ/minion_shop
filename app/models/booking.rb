class Booking < ApplicationRecord
  belongs_to :user
  has_many :booking_items

  accepts_nested_attributes_for :booking_items,
                                allow_destroy: true

  validates :user_id, :total_quantity, :date, presence: true

end
