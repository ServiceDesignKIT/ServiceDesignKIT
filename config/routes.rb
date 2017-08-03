require 'api_constraints'

Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks",
                                    confirmations:      "users/confirmations",
                                    passwords:          "users/passwords",
                                    sessions:           "users/sessions",
                                    registrations:      "users/registrations" }

  root 'homes#show'

  resources :techniques

  resources :favorites, only: :index
  resource :about, only: :show
  resource :contact, only: :show
  resource :impressum, only: :show

  resources :users, only: [:show, :edit, :update]
  get 'tags/:tag', to: 'homes#show', as: :tag


  namespace :admin do
    root 'techniques#index'
    resources :techniques, only: [:index, :edit]
  end

  namespace :api do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do

      resources :posts, only: [:index, :create, :update] do
        resources :comments, only: [:create, :destroy]
      end

      resources :sub_categories, only: :index
      resource :users, only: :update

      resources :favorites, only: [:index, :create, :destroy]

      namespace :admin do
        resources :posts, only: [:show, :update, :destroy]
      end

    end
  end

  get '/status', to:  lambda { |env| [200, {'Content-Type' => 'text/plain'}, ["OK\n"]] }
  get '/server-status', to:  lambda { |env| [200, {'Content-Type' => 'text/plain'}, ["OK\n"]] }
  get '/basic_status', to:  lambda { |env| [200, {'Content-Type' => 'text/plain'}, ["OK\n"]] }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
