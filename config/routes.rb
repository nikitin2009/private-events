Rails.application.routes.draw do
  root 'users#new'
  get 'signin', to: "sessions#new"
  post 'signin', to: "sessions#create"
  delete 'signout', to: "sessions#destroy"
  resources :users, only: [:new, :create, :show]
end
