Rails.application.routes.draw do
  root 'pages#index'
  get  '/about', to: 'pages#about' 

  resources :users
  resources :plans
  resources :costs
  resources :cals

  get    'sessions/new'
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
