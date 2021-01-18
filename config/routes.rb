Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create]
      get "/followers/:id", to: "users#followers"
      get "/following/:id", to: "users#following"
      get '/profile', to: 'users#profile'

      get '/watchlists/:id', to: 'watchlists#show'
      get '/user_watchlist/:user_id', to: 'watchlists#user_watchlist' #use this to fetch user's watchlist

     get '/reviews', to: 'reviews#index'
     post '/reviews', to: 'reviews#create'
     get '/movie_review/:movie_id', to: 'movies#movie_reviews' #get all reviews for a movie
     get '/movie_reviews/:movie_id', to: 'reviews#movie_reviews' # use this to just get a specific movie based on their TMDB id
      get "/followee_reviews", to: "reviews#followee_reviews" #use this to get a list of a user's followee's reviews
      get '/movies', to: 'movies#index'
      post '/movies', to: 'movies#create'
      get '/find_movie/:movie_id', to: 'movies#find_movie'
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'

    end
  end
end
