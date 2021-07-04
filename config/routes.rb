# frozen_string_literal: true

Rails.application.routes.draw do
  root 'feeds#index'
  resources :feeds do
    resources :posts
  end
  get '/posts', to: 'posts#index'
end
