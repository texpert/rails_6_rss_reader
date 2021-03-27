# frozen_string_literal: true

Rails.application.routes.draw do
  root 'feeds#index'
  resources :feeds
  get '/posts', to: 'posts#index'

  mount Shrine.presign_endpoint(:cache) => '/presign'
end
