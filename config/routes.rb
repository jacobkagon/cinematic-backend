Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get '/users', to: "users#index"
      get '/users/:id', to: 'users#show'
      post "/users", to: "users#create"
      get "/followers/:id", to: "users#followers"
      get "/following/:id", to: "users#following"
      get '/profile', to: 'users#profile'

      get '/watchlists/:id', to: 'watchlists#show'
      get '/user_watchlist/:user_id', to: 'watchlists#user_watchlist'

      resource :reviews, only: [:index, :create]
      get "/followee_reviews", to: "reviews#followee_reviews"
      resource :movies, only: [:index, :create, :show]

    end
  end
end
