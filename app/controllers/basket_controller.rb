class BasketController < ApplicationController
  def update
    if session[:current_basket].nil?
      session[:current_basket] = Hash.new
    end
    session[:current_basket][params[:id]]=params[:basket][:quantidade]

    session[:basket_total] = 0
    session[:current_basket].each do |k,v|
      session[:basket_total] += v.to_i
      session[:current_basket].except!(k) unless v.to_i>0
    end

    redirect_to products_path
  end

  def index

  end
end
