Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "events#index"
  resources :users, only: [:show,]
  resources :events, only: [:new, :create, :index, :show]
  resources :invitations, only: [:create]
end