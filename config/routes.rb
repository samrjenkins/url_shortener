# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  get '/:id' => "shortener/shortened_urls#show", id: Shortener::Regexp
end
