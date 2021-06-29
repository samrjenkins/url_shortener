# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :shortened_urls, only: %i[index new create]
  constraints subdomain: 's' do
    resources :shortened_urls, path: '', only: :show, module: :shortener
  end
end
