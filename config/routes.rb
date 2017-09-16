Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'

  # get '/', :to => 'welcome#index', :as => 'welcome'

  resources :items, only: [:index, :show]

  resources :carts, only: [:create]

  resources :users, only: [:new, :create]

  resources :orders, only: [:index, :show, :create]

  namespace :admin do
    resources :dashboard, only: [:index]
    # get '/dashboard', to: "admindashboard#dashboard"
  end

  get "/dashboard", to: "users#show"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"


  get '/cart', to: "carts#index", as: "cart"
  delete '/cart/:id', to: "carts#destroy", as: "cart_remove_item"
  put '/cart/:id', to: "carts#update", as: "cart_add_item"
  get '/:category_name', to: 'categories#show'

end
