Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :content
      post '/favorites', to: 'favorites#create'
      delete '/favorites/:id', to: 'favorites#destroy'
      post '/login', to: 'auth#create'
      get '/current_user', to: 'auth#show'
    end
  end
end
