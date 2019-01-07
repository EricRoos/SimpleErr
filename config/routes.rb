# frozen_string_literal: true

Rails.application.routes.draw do
  get 'app_tokens/create'
  get 'app_tokens/destry'
  resources :client_apps do
    member do
      get 'integrations', to: 'integrations#index'
    end
    resources :app_tokens
    resources :client_app_errors
  end
  devise_for :users
  root to: 'static#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
