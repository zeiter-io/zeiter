Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  get 'users/index'
  resources :users
  resources :schedules
  resources :assignments
  root 'home#index'  
end
