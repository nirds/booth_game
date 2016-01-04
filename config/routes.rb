Rails.application.routes.draw do
  devise_for :admins
  resources :contestants

  post 'tickets/drawing' => 'tickets#drawing'

  root to: 'static_pages#home'
end