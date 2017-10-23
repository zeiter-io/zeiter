Rails.application.routes.draw do
  resources :shifts
  devise_for :users

  get 'home/index'
  resources :users

  resources :schedules do
    resources :enrollments, shallow: true, except: :index
  end
  get 'schedules/:id/enrollments', to: redirect('/schedules/%{id}')

  # Global Search - Typeahead feature
  resources :search do
    collection do
      get :global
    end
  end

  root 'home#index'
end
