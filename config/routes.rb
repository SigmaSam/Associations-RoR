Rails.application.routes.draw do
  
  root 'events#index'
  resources :events
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :attendances, only: [:new, :create, :destroy]

  get 'sessions/new'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

end
