Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'test#route'
get '/', :to => 'test#route', :as => 'test_route'

end
