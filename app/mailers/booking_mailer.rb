class BookingMailer < ApplicationMailer

  default from: ENV['DEFAULT_EMAIL_FROM']

  def confirmation(booking)
    @booking = booking

    mail to: @booking.user.email, :subject => "Sua reserva de Minions", :cc => ENV['DEFAULT_EMAIL_CC_TO']
  end
end