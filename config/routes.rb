Rails.application.routes.draw do
  root 'users#new'
  get 'signin', to: "sessions#new"
  post 'signin', to: "sessions#create"
  resources :users, only: [:new, :create, :show]
end
