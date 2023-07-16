Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "projects#index"

  get "/projects", to: "projects#index"
  get "/projects/:id", to: "projects#show"
  get "/contestants", to: "contestants#index"
end
