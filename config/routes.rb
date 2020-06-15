Rails.application.routes.draw do
  root 'surgical_operations#index'
  devise_for :users
  resources :surgical_operations
  resources :stocks, only: [:create, :destroy]
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get '/users/:id/stocks', to: 'users#stocks'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
