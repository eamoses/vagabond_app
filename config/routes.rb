Rails.application.routes.draw do

  #|VERB   |URL                                |CONTROLLER             |ALIAS
  root                                        to: "cities#index"

  get     "/cities/:city_id/posts",           to: "posts#index",      as: "city_posts"
  post    "/cities/:city_id/posts",           to: "posts#create"
  get     "/cities/:city_id/posts/new",       to: "posts#new",        as: "new_city_post"
  get     "/cities/:city_id/posts/:id/edit",  to: "posts#edit",       as: "edit_city_post"
  get     "/cities/:city_id/posts/:id",       to: "posts#show",       as: "city_post"
  patch   "/cities/:city_id/posts/:id",       to: "posts#update"
  put     "/cities/:city_id/posts/:id",       to: "posts#update"
  delete  "/cities/:city_id/posts/:id",       to: "posts#destroy"

  get     "/cities",                          to: "cities#index",     as: "cities"
  post    "/cities",                          to: "cities#create"
  get     "/cities/new",                      to: "cities#new",       as: "new_city"
  get     "/cities/:id/edit",                 to: "cities#edit",      as: "edit_city"
  get     "/cities/:id",                      to: "cities#show",      as: "city"
  patch   "/cities/:id",                      to: "cities#update"
  put     "cities/:id",                       to: "cities#update"
  delete  "cities/:id",                       to: "cities#destroy"

  get     "/users",                           to: "users#index",      as: "users"
  post    "/users",                           to: "users#create"
  get     "/users/new",                       to: "users#new",        as: "new_user"
  get     "/users/:id/edit",                  to: "users#edit",       as: "edit_user"
  get     "/users/:id",                       to: "users#show",       as: "user"
  patch   "/users/:id",                       to: "users#update"
  put     "/users/:id",                       to: "users#update"
  delete  "/users/:id",                       to: "users#destroy"





  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"


end
