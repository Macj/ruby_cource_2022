Rails.application.routes.draw do
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
  get 'comment/time', to: "comment#time"
  get 'comment/name', to: "comment#name"
end
