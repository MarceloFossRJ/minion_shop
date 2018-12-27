class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    added_attrs = [:name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def update_basket_total
    session[:basket_total] = 0
    session[:current_basket].each do |k,v|
      session[:basket_total] += v.to_i
      session[:current_basket].except!(k) unless v.to_i>0
    end
  end

  def clean_basket
    session[:basket_total] = 0
    session[:current_basket] = nil
  end
end
