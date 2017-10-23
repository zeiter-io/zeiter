Rails.application.routes.draw do
  resources :shifts
  devise_for :users

  # Global Search - Typeahead drop down
  resources :users do
    collection do
      get :typeahead
    end
  end

  resources :schedules do
    resources :enrollments, shallow: true, except: :index
  end

  get 'schedules/:id/enrollments', to: redirect('/schedules/%{id}')

  root 'home#index'
end
