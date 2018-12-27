class BookingsController < ApplicationController

  # GET /bookings
  # GET /bookings.json
  def index
    #@bookings = Booking.all
  end

  # POST /bookings
  # POST /bookings.json
  def create
    params[:basket].each do |k,v|
      session[:current_basket][k]=v
    end
    update_basket_total

    if params[:commit] == 'Reservar'
      if user_signed_in?
        b = Hash.new
        b["user_id"] = current_user.id
        b["total_quantity"] = session[:basket_total].to_i
        b["date"] = Time.now

        b['booking_items_attributes'] = Hash.new
        i = 0
        session[:current_basket].each do |k,v|
          b['booking_items_attributes'][i] = {'quantity' => v, 'product_id' => k}
          i+=1
        end

        booking_params = b

        @booking = Booking.new(booking_params)

        respond_to do |format|
          if @booking.save

            clean_basket
            format.html { redirect_to products_path, notice: "Booking was successfully created." }
          else
            format.html { redirect_to products_path, notice: "Aconteceu um erro: #{@booking.errors.to_hash}" }
          end
        end
      else
        respond_to do |format|
          format.html { redirect_to new_user_session_path, notice: "Você deve se logar para continuar." }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to products_path, notice: "Cesta atualizada com sucesso." }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:user_id, :date, :email_sent_at, :total_quantity, booking_items_attributes: [:id, :product_id, :booking_id, :quantity, :_destroy])
    end
end
