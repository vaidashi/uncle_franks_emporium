Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'

  # get '/', :to => 'welcome#index', :as => 'welcome'

  resources :items, only: [:index, :show]

  resources :carts, only: [:create]


  get '/cart', to: "carts#index", as: "cart"
  delete '/cart/:id', to: "carts#destroy", as: "cart_remove_item"
  get '/:category_name', to: 'categories#show'

end
