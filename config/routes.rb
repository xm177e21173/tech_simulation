Rails.application.routes.draw do
  root 'pages#index'

  resources :users
  resources :plans
  resources :costs

  get    'sessions/new'
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
