Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  resources :shifts
  resources :users

  resources :schedules do
    resources :enrollments, shallow: true, except: :index
  end

  # Nest enrollments inside schedules
  get 'schedules/:id/enrollments', to: redirect('/schedules/%{id}')

  # Navbar Search - Typeahead feature
  resources :search do
    collection do
      get :global
      get :all # Navbar Search results
    end
  end

end
