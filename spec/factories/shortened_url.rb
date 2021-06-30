# frozen_string_literal: true

FactoryBot.define do
  factory :shortened_url do
    after :build do |shortened_url|
      if Shortener.auto_clean_url
        shortened_url.url = ShortenedUrl.clean_url(shortened_url.url)
      end
    end
  end
end
