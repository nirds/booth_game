Rails.application.routes.draw do
  devise_for :admins
  resources :contestants

  root to: 'static_pages#home'
end