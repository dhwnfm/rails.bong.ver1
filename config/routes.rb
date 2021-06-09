Rails.application.routes.draw do
  get 'users/show' 
  root 'home#index'
  devise_for :users
  resources :users 
  get 'rooms/index'
  get 'rooms/new'
  get 'rooms/create'
  get 'rooms/show'
  get 'rooms/edit'
  get 'rooms/update'
  resources :rooms 
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
