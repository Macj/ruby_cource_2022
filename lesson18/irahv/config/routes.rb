Rails.application.routes.draw do
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
get '/Ira/time', to: "lips#time"
get '/Ira/name', to: "lips#name"
  # Defines the root path route ("/")
  # root "articles#index"
end
