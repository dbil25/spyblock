Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'home#index'
  get :join_game, to: "home#join_game"
  post :create_player, to: "home#create_player"
  get :new_game, to: "home#new_game"
  post :create_game, to: "home#create_game"

  resources :rooms, only: [:show]
end
