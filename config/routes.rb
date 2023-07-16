Rails.application.routes.draw do
  get "/contestants", to: "contestants#index"
  get "/projects/:id", to: "projects#show"
end
