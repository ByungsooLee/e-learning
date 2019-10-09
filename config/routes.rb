Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'
  get 'about',to: 'static_pages#about'
  get '/signup', to:'users#new'
  get '/login', to:'sessions#new'
  resources :users
  # get '/login', to:'sessions#new'
  # get '/home_feed',to:'microposts#new'
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
