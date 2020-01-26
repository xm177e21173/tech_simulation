Rails.application.routes.draw do
  get 'cals/new'
  root 'pages#index'

  resources :users
  resources :plans
  resources :costs
  resources :cals

  get    'sessions/new'
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
