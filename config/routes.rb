Rails.application.routes.draw do

  resources :users
  resources :items
  resources :businesses

  root 'home#index'
end
