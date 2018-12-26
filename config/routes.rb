Rails.application.routes.draw do

  resources :products, only: [:index, :show]
  get 'home/index'

  root to: 'products#index'
  resources :basket , only: [:index, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
