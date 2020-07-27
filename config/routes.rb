Rails.application.routes.draw do
  root to: 'surgical_operations#index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get '/users/show', to: 'users#show'
  resources :notifications, only: :index
  resources :surgical_operations do
    resources :comments
    resources :readings
  end
  resources :stocks, only: [:create, :destroy]
  get '/users/:id/stocks', to: 'users#stocks'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  resources :cards, only: [:new, :show] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end

  resources :purchases, only: [:index] do
    collection do
      get 'index', to: 'purchases#index'
      post 'pay', to: 'purchases#pay'
      get 'done', to: 'purchases#done'
    end
  end
end
