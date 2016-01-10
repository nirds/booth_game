Rails.application.routes.draw do
  devise_for :admins
  resources :contacts, :games

  post 'tickets/drawing' => 'tickets#drawing'

  root to: 'static_pages#home'
end