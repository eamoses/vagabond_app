Rails.application.routes.draw do



















  get "/login", to: "sessions#new", as: "new_session"
  get "/logout", to: "sessions#destroy" 
  post "/sessions", to: "sessions#create"

end
