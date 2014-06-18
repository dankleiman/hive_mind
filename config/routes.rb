Rails.application.routes.draw do
  resources :achievements, only: [:index, :create, :new]

end
