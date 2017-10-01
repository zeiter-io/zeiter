Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  get 'users/index'
  resources :users
  resources :assignments
  resources :schedules
  root 'home#index'  
end
