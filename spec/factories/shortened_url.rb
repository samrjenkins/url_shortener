# frozen_string_literal: true

FactoryBot.define do
  factory :shortened_url do
    url { 'http://www.example.com' }

    after :build do |shortened_url|
      shortened_url.url = ShortenedUrl.clean_url(shortened_url.url) if Shortener.auto_clean_url
    end
  end
end
