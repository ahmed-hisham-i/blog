Rails.application.routes.draw do
  resources :articles
  resources :users, except: [:new]
  root to: 'pages#home'
  get 'login', to: 'sessions#new'
  get 'signup', to: 'users#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
