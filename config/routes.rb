Rails.application.routes.draw do
  resources :achievements, only: [:index, :create, :new] do
    resources :votes, only: :create
  end
    resources :votes, only: :create

  root 'sessions#index'

  get 'auth/github/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/questions')
  get 'signout', to: 'sessions#destroy', as: 'signout'

end
