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
  resources :cinemas do
    resources :screenings do
      resources :books
    end
  end
  resources :screenings do
    resources :books
  end
  get 'booking_confirmation/:id', to: 'books#confirmation', as: :booking_confirmation
  resources :users
  resources :movies
  resources :cinemas do
    resources :books, only: %i[new create]
  end
  resources :books
end