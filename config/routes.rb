Rails.application.routes.draw do
  root 'events#index'
  get 'signin', to: "sessions#new"
  post 'signin', to: "sessions#create"
  delete 'signout', to: "sessions#destroy"
  resources :users, only: [:new, :create, :show]
  resources :events, only: [:new, :index, :create, :show]
  resources :invitations, only: [:create, :update]
end
