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

end
