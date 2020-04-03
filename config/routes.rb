Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :apartments, only: %i[new index create show] do
  resources :consumptions
  resources :tenants#, only: [:create, :new]
  end
#resources :tenants, only: [:index]
end
