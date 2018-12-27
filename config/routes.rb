Rails.application.routes.draw do

  resources :bookings, only: [:create]
  devise_for :users
  resources :products, only: [:index, :show]
  get 'home/index'

  root to: 'products#index'
  resources :basket , only: [:index, :update]
end
