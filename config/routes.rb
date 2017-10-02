Rails.application.routes.draw do
  resources :shifts
  devise_for :users
  get 'home/index'
  get 'users/index'
#  get 'users/:id' => 'users#show'
  resources :users
  root 'home#index'  
end
