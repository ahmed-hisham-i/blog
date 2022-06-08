Rails.application.routes.draw do
  resources :articles
  resources :users, except: [:new]
  root to: 'pages#home'
  get 'signup', to: 'users#new'
end
