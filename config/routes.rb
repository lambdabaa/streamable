Streamable::Application.routes.draw do
  root :to => 'streams#index'

  match 'users/logout' => 'application#logout'
  
  match 'streams/:id/broadcast' => 'streams#broadcast'
  match 'streams/index(/:params)' => 'streams#index'  
  resources :streams
  
  match 'users/logout' => 'application#logout'
  resources :users, :only => [:show, :new]
  
  resources :subscriptions, :only => [:create, :destroy]
  
  match 'auth/facebook/callback' => 'users#facebook_callback'
end
