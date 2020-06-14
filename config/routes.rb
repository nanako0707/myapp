Rails.application.routes.draw do
  root 'surgical_operations#index'
  resources :surgical_operations
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
