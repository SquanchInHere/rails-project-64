# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :posts, except: %i[index] do
    resources :comments, module: :posts
    resources :likes, module: :posts
  end

  root 'posts#index'
end
