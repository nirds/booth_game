Rails.application.routes.draw do
  devise_for :admins, :controllers => { :registrations => "registrations" }
  resources :contacts, :games, :prizes

  post 'tickets/drawing' => 'tickets#drawing'
  post 'games/:id/update_scores' => 'games#update_scores', as: "update_scores"
  get 'games/:id/enroll_contestants' => 'games#enroll_contestants', as: "enroll_contestants"
  get 'games/:id/draw_winner' => 'games#draw_winner', as: "draw_winner"
  get 'games/:id/end_game' => 'games#end_game', as: "end_game"

  root to: 'static_pages#home'
end