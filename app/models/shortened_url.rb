# frozen_string_literal: true

class ShortenedUrl < Shortener::ShortenedUrl
  validates :url, url: true
end
