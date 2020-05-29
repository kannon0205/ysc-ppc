Rails.application.routes.draw do

  post "games/create" => "games#create"
  get 'games/:id/edit' => "games#edit"
  post "games/:id/destroy" => "games#destroy"
  post "games/:id/create_surve_a" => "games#create_surve_a"
  post "games/:id/create_surve_b" => "games#create_surve_b"
  post "games/:id/surve_reset" => "games#surve_reset"
  post "games/:game_id/:member_id/create_player_a" => "games#create_player_a"
  post "games/:game_id/:member_id/create_player_b" => "games#create_player_b"
  post "games/:game_id/player_reset_a" => "games#player_reset_a"
  post "games/:game_id/player_reset_b" => "games#player_reset_b"
  get "games/:id/show" => "games#show"
  post "games/:game_id/:player/plus" => "games#plus"
  post "games/:game_id/:player/minus" => "games#minus"
  get "games/:game_id/:player/result" => "games#result"
  post "games/:game_id/:player/record" => "games#record"
  post "games/:game_id/:player/back" => "games#back"

  get 'members/new' => "members#new"
  post "members/create" => "members#create"
  post "members/:id/destroy" => "members#destroy"
  get "members/:id/edit" => "members#edit"
  post "members/:id/update" => "members#update"

  get "/" => "home#top"
end
