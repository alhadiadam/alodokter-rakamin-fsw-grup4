Rails.application.routes.draw do
  
  namespace 'api' do
    namespace 'v1' do
      resources :users, only: [:create]
      root 'welcome#index'
      get'/sign_in', to: "users#new"
      post '/login', to: "users#login"
      get '/show', to: "users#show"
      put '/update', to: "users#update"
      post 'passwords/forgot', to: 'passwords#forgot'
      patch 'passwords/reset', to: 'passwords#reset'
      get 'passwords/reset', to: 'passwords#reset_edit'
      get 'doctors/search', to: "doctors#search"
      get 'articles/search', to:"articles#search"
      resources :articles
      resources :doctors
      
    end
  end
end
