Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  get 'users/index'
  resources :users do
    resources :schedules
  end
  resources :schedules_users
  root 'home#index'  
end
