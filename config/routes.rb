Rails.application.routes.draw do
  resources :sessions
  resources :users
  resources :events
  get 'logout', to: 'sessions#destroy', as: 'logout'
  root 'events#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
