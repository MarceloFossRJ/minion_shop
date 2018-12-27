class BookingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.confirmation.subject
  #
  def confirmation(booking)
    @booking = booking

    mail to: "marcelo.foss.rj@gmail.com", :subject => "Sua reserva de Minions"
  end
end
