Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  get 'users/index'
  resources :users 
  resources :schedules
  resources :schedules_users
  root 'home#index'  
end
