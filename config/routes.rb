Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/users', to: 'users#create'
      get '/profile', to: 'users#profile'
      post '/search', to: 'search#cari'
      post 'login', to: 'auth#login'
    end
  end
end
