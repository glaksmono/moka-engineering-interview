Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users
  resources :items
  resources :businesses

  # Below are no longer required after implementing devise 
  #get    '/signup',       to: 'users#new'ite
  # get    '/login',        to: 'sessions#new'
  # post   '/login',        to: 'sessions#create'
  # delete '/logout',       to: 'sessions#destroy'


  root 'items#index'
end