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
      get '/user_watchlist/:user_id', to: 'watchlists#user_watchlist' #use this to fetch user's watchlist

     get '/reviews', to: 'reviews#index'
     get '/movie_reviews/:movie_id', to: 'reviews#movie_reviews'
      get "/followee_reviews", to: "reviews#followee_reviews" #use this to get a list of a user's followee's reviews
      get '/movies', to: 'movies#index'
      post '/movies', to: 'movies#create'

    end
  end
end
