class BasketController < ApplicationController
  def update
    if session[:current_basket].nil?
      session[:current_basket] = Hash.new
    end
    session[:current_basket][params[:id]]=params[:basket][:quantidade]

    update_basket_total

    redirect_to products_path
  end

  def index
    if session[:basket_total] == 0
      respond_to do |format|
        format.html { redirect_to products_path, notice: "Cesta está vazia!" }
      end
    end
  end
end
