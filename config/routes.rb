# frozen_string_literal: true

Rails.application.routes.draw do
  root 'feeds#index'

  mount Rapi::Base => '/rapi'

  resources :feeds do
    resources :posts
  end
  get '/posts', to: 'posts#index'

  mount Shrine.presign_endpoint(:cache) => '/s3/params'
end
