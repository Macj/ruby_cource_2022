Rails.application.routes.draw do
  devise_for :admins , path: 'auth', path_names: { sign_in: 'login',
                                                                    sign_out: 'logout',
                                                                    password: 'secret',
                                                                    confirmation: 'verification',
                                                                    unlock: 'unblock',
                                                                    registration: 'register',
                                                                    sign_up: 'cmon_let_me_in' }
  resources :spares
  resources :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/news", to: "news#list"
  # Defines the root path route ("/")
   root "spares#index"
end
