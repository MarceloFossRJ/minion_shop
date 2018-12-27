# Preview all emails at http://localhost:3000/rails/mailers/booking
class BookingPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/booking/confirmation
  def confirmation
    BookingMailer.confirmation
  end

end
