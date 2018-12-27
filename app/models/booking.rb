class Booking < ApplicationRecord
  belongs_to :user
  has_many :booking_items

  accepts_nested_attributes_for :booking_items,
                                allow_destroy: true

  after_create :send_confirmation_email

  validates :user_id, :total_quantity, :date, presence: true


  private

  def send_confirmation_email
    BookingMailer.confirmation(self).deliver
    self.email_sent_at = Time.zone.now
    save!
  end
end
