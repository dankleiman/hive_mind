Rails.application.routes.draw do
  resources :achievements, only: [:index, :create, :new, :edit, :destroy] do
    resources :votes, only: :create
  end
    resources :votes, only: :create

  root 'sessions#index'

  get 'achievements/edit', to: 'achievements#edit'
  get 'auth/github/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/questions')
  get 'signout', to: 'sessions#destroy', as: 'signout'

end
