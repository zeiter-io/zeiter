Rails.application.routes.draw do
  resources :shifts
  devise_for :users
  get 'home/index'
  get 'users/index'
  resources :users
  resources :schedules do 
    resources :assignments, shallow: true, except: :index
  end
  get 'schedules/:id/assignments', to: redirect('/schedules/%{id}')  
  root 'home#index'  
end
