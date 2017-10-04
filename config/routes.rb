Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  get 'users/index'
  resources :users
  resources :schedules do 
    resources :assignments, shallow: true  
  end
  root 'home#index'  
end
