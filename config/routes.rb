Rails.application.routes.draw do
  get("/", { :controller => "places", :action => "index" })

# Explicit login and logout paths (to match layout)
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"

  resources "entries"
  resources "places"
  resources "sessions"
  resources "users"
end
