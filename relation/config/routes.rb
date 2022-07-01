Rails.application.routes.draw do
  resources :songs
  resources :artists

  # get  '/artists', to: "artists#index"
  # get  '/artists/:id', to: "artists#show"
  # get  '/artists/:id/edit', to: "artists#edit"
  # get  '/artists/new', to: "artists#new", as: :new
  # post '/artists', to: "artists#create"
  # put '/artists/:id', to: "artists#update"
  # delete '/artists/:id', to: "artists#destroy"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
