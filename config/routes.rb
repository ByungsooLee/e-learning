Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'
  get 'about',to: 'static_pages#about'
  get '/signup', to:'users#new'
  get '/login', to:'sessions#new'
  delete '/logout', to:'sessions#destroy'
  resources :users
  # get '/login', to:'sessions#new'
  # get '/home_feed',to:'microposts#new'
  resources :sessions

  namespace :admin do
    resources :static_pages do
      member do
        get 'admin_page'
      end
    end
    resources :users
  end
end
