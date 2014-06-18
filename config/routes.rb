Rails.application.routes.draw do
  resources :achievements, only: [:index, :create, :new]
  resources :votes, only: [:create, :update]

  root 'achievements#index'

  match 'auth/github/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/questions'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

end
