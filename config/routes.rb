Rails.application.routes.draw do
  root 'statistics#index'
  get 'statistics', to: 'statistics#index'

  get 'network', to: 'network#index'
  
  get 'settings', to: 'settings#edit'
  get 'perform_nmap_scan' => "settings#perform_nmap_scan"
  patch 'settings', to: 'settings#update'
  post 'settings', to: 'settings#create'

  resources :devices
end
