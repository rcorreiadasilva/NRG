Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :tenants , only: [:index, :show, :destroy]
resources :apartments do
  resources :consumptions
  resources :tenants, only: [:new, :create]
  #resources :tenants#, only: [:create, :new]
  end

end






# resources :reviews, only: [:show]

#   resources :restaurants do
#     # Two nested routes for reviews
#     #
#     # GET /restaurants/:restaurant_id/reviews/new
#     # POST /restaurants/:restaurant_id/reviews
#     resources :reviews, only: [:new, :create]

#     # GET /restaurants/:restaurant_id/reviews/:id WRONG!!!!!
#     # GET /reviews/:id

#     collection do # collection routes
#       get :top # get '/restaurants/top', to: 'restaurants#top'
#     end

#     member do # member routes (about specific restaurants)
#       get :chef # get '/restaurants/:id/chef', to: 'restaurants#chef'
#       # get :reviews # get "restaurants/:id/reviews", to: "restaurants#reviews"
#     end
#   end
