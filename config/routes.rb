Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "static_pages#home"

  get "users/new", to: "users#new", as: "new_users"
  post "users", to: "users#submit", as: "submit_users"
  
  get "games/result/:user_id", to: "search_games#search", as: "result"
end
