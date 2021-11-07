Rails.application.routes.draw do
  get 'statistics', to: 'statistics#index'
  get 'network', to: 'network#index'
  get 'settings', to: 'settings#edit'
  patch 'settings', to: 'settings#update'
  post 'settings', to: 'settings#create'

  resources :devices
end
