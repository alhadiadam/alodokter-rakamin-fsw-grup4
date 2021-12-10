Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :users, only: [:create]
      post '/login', to: "users#login"
      get '/show', to: "users#show"
      put '/update', to: "users#update"
      resources :artikels
      resources :lists
    end
  end
end
