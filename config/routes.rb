# Frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#index'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/screenings/new', to: 'screenings#new', as: 'screenings_new'
  post '/screenings', to: 'screenings#create', as: 'screenings_create'
  resources :screenings

  resources :users
  resources :movies do
    collection do
      get 'search'
    end
    resources :books
  end
  resources :cinemas do
    resources :books, only: :index, on: :member
  end
  resources :books
  resources :cinemas do
    resources :movies do
      resources :books
    end
  end
end
