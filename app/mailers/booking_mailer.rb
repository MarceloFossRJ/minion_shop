class BookingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.confirmation.subject
  #
  def confirmation(booking)
    @booking = booking

    mail to: ENV['DEFAULT_EMAIL_TO'], :subject => "Sua reserva de Minions"
  end
end