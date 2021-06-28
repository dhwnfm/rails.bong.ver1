Rails.application.routes.draw do
  get 'users/show' 
  root 'home#index'
  devise_for :users
  resources :users 
  resources :rooms 
  get '/reserve' => 'rooms#reserve'
  resources :reservations
  get '/lend' => 'reservations#lend'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
