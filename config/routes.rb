Rails.application.routes.draw do
  root to: 'surgical_operations#index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get '/users/show', to: 'users#show'
  resources :notifications, only: :index
  resources :surgical_operations do
    resources :comments
    resources :readings
    collection do
      post 'pay/:id', to: 'surgical_operations#pay', as: 'pay'
    end
  end
  resources :stocks, only: [:create, :destroy]
  get '/users/:id/stocks', to: 'users#stocks'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
