Rails.application.routes.draw do
  require "sidekiq/web"
  mount Sidekiq::Web => "/sidekiq"

  get 'braintree/new'
  get 'listing/index'
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"


  get 'welcome/index'

  root 'welcome#index'

  get 'listings/index'
  resources :listings, controller: "listings" do
    resources :reservations, except: :index
  end
  resources :reservations, only:[:index]
  get '/listings/verify/:id' => 'listings#verify', as: "verify"

  post 'braintree/checkout'

  get "search" => "search#index"


  # get "/listings/:id/reservation" => "reservations#show", as: "reservation"
  # post "/listings/:id/reservation" => "reservation#crceate", as: "post_reservation"

  # resources :reservations, controller: "reservations" 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, controller: "users"
  get '/users/:id' => "users#show"
end
