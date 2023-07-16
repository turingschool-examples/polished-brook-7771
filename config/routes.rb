Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # Routes for welcome
  get '/', to: 'application#welcome', as: 'root'

  # Routes for challenges
  get '/challenges', to: 'challenges#index', as: 'challenges'
  get '/challenges/new', to: 'challenges#new', as: 'new_challenge'
  get '/challenges/:id', to: 'challenges#show', as: 'challenge'
  post '/challenges', to: 'challenges#create', as: 'create_challenge'
  get '/challenges/:id/edit', to: 'challenges#edit', as: 'edit_challenge'
  patch '/challenges/:id', to: 'challenges#update', as: 'update_challenge'
  delete '/challenges/:id', to: 'challenges#destroy', as: 'delete_challenge'

  # Routes for contestants
  get '/contestants', to: 'contestants#index', as: 'contestants'
  get '/contestants/new', to: 'contestants#new', as: 'new_contestant'
  get '/contestants/:id', to: 'contestants#show', as: 'contestant'
  post '/contestants', to: 'contestants#create', as: 'create_contestant'
  get '/contestants/:id/edit', to: 'contestants#edit', as: 'edit_contestant'
  patch '/contestants/:id', to: 'contestants#update', as: 'update_contestant'
  delete '/contestants/:id', to: 'contestants#destroy', as: 'delete_contestant'

  # Routes for projects
  get '/projects', to: 'projects#index', as: 'projects'
  get '/projects/new', to: 'projects#new', as: 'new_project'
  get '/projects/:id', to: 'projects#show', as: 'project'
  post '/projects', to: 'projects#create', as: 'create_project'
  get '/projects/:id/edit', to: 'projects#edit', as: 'edit_project'
  patch '/projects/:id', to: 'projects#update', as: 'update_project'
  delete '/projects/:id', to: 'projects#destroy', as: 'delete_project'

  # Routes for contestant_projects
  get '/contestants_projects', to: 'contestants_projects#index', as: 'contestant_projects'
  get '/contestants_projects/new', to: 'contestants_projects#new', as: 'new_contestant_project'
  get '/contestants_projects/:id', to: 'contestants_projects#show', as: 'contestant_project'
  post '/contestants_projects', to: 'contestants_projects#create', as: 'create_contestant_project'
  get '/contestants_projects/:id/edit', to: 'contestants_projects#edit', as: 'edit_contestant_project'
  patch '/contestants_projects/:id', to: 'contestants_projects#update', as: 'update_contestant_project'
  delete '/contestants_projects/:id', to: 'contestants_projects#destroy', as: 'delete_contestant_project'
end
