Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
 
  get '/project/:id', to: 'projects#show'
  get '/projects', to: 'projects#index'
  post '/projects/:id/contestants', to: 'projects#add_contestant'
  
  get '/contestants', to: 'contestants#index'
  
end
