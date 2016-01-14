Rails.application.routes.draw do
  devise_for :admins
  resources :contacts, :games

  post 'tickets/drawing' => 'tickets#drawing'
  post 'games/:id/update_scores' => 'games#update_scores', as: "update_scores"
  get 'games/:id/draw_winner' => 'games#draw_winner', as: "draw_winner"
  get 'games/:id/end_game' => 'games#end_game', as: "end_game"

  root to: 'static_pages#home'
end