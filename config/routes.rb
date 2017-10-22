Rails.application.routes.draw do
  resources :shifts
  devise_for :users
  get 'home/index'
  get 'users/index'
  resources :users
  resources :schedules do 
    resources :enrollments, shallow: true, except: :index
  end
  get 'schedules/:id/enrollments', to: redirect('/schedules/%{id}')  
  root 'home#index'  
end
