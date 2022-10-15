# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  resources :users, only: %i[index show create update destroy]
  post 'login', to: 'authentication#authenticate', controller: 'authentication'
end
