Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create]
      resources :friendships, only: [:create]
      get "/followers/:id", to: "users#followers"
      get "/following/:id", to: "users#following"
      get '/profile', to: 'users#profile'

      get '/watchlists/:id', to: 'watchlists#show'
      get '/user_watchlist/:user_id', to: 'watchlists#user_watchlist' #use this to fetch user's watchlist
      
    

     get '/reviews', to: 'reviews#index'
     get '/profile', to: 'users#profile'
     get '/movie_review/:movie_id', to: 'movies#movie_reviews' #get all reviews for a movie
     get '/movie_reviews/:movie_id', to: 'reviews#movie_reviews' # use this to just get a specific movie based on their TMDB id
     get "/followee_reviews", to: "reviews#followee_reviews" #use this to get a list of a user's followee's reviews
     get '/movies', to: 'movies#index'
     get '/find_movie/:movie_id', to: 'movies#find_movie'

      post '/login', to: 'auth#create'
      post '/reviews', to: 'reviews#create'
      post '/movies', to: 'movies#create'
      post '/follow/:id', to: 'users#follow_user' #use to follow another user
      post '/watchlist', to: 'watchlists#create'


      delete '/reviews/:id', to: 'reviews#destroy'
      delete '/watchlist/:user_id/:movie_id',  to: 'watchlists#destroy'
      delete '/friendships/:followee_id/:follower_id', to: 'friendships#destroy'
      

    end
  end
end
