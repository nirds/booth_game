Rails.application.routes.draw do
  root 'contestants#index'

  resources :contestants
end