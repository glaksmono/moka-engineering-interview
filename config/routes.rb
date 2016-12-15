Rails.application.routes.draw do

  resources :users
  resources :items
  resources :business

  get    '/dashboard',    to: 'dashboard#index'
  get    '/signup',       to: 'home#signup'

  get    '/login',        to: 'sessions#new'
  post   '/login',        to: 'sessions#create'
  delete '/logout',       to: 'sessions#destroy'

  root 'home#index'
end
