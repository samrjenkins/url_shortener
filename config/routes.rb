# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :shortened_urls, only: %i[index new create]
  get '/:id' => "shortener/shortened_urls#show", id: Shortener::Regexp
end
