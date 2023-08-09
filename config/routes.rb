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
  # resources :cinemas, only: %i[] do
  #   resources :screenings, only: %i[] do
  #     resources :books, only: %i[]
  #   end
  # end
  resources :screenings, only: %i[] do
    resources :books, only: %i[new create]
  end
  get 'booking_confirmation/:id', to: 'books#confirmation', as: :booking_confirmation
  resources :users, only: %i[new index create]
  resources :movies, only: %i[show index new edit create update]
  resources :cinemas, only: %i[show index new edit create update] do
    resources :books, only: %i[]
  end
  resources :books, only: %i[index]
  match '*path', to: 'application#route_not_found', via: :all
end
