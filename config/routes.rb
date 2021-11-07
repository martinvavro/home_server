Rails.application.routes.draw do
  get 'statistics', to: 'statistics#index'
  get "/network", to: "network#index"

  resources :settings
  resources :devices
end
