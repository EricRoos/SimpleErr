Rails.application.routes.draw do
  resources :client_apps
  devise_for :users
  root to: 'static#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
