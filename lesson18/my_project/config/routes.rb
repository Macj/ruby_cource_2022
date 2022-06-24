Rails.application.routes.draw do
  resources :projects
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/senior/time', to: "my_control#time"
  get '/senior/name', to: "my_control#name"

  # Defines the root path route ("/")
  # root "articles#index"
end
