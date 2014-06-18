Rails.application.routes.draw do
  resources :achievements, only: [:index, :create, :new]

  root 'achievements#index'

  match 'auth/github/callback', to: 'sessions#create', via: [:get, :post]
end
