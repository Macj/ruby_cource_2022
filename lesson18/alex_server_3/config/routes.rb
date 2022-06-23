Rails.application.routes.draw do
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
 get '/alex/time', to: "alex#time"
 get '/alex/name', to: "alex#name"


end
