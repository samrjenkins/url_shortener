# frozen_string_literal: true

class ShortenedUrlsController < ApplicationController
  def index
    @shortened_urls = Shortener::ShortenedUrl.all
  end
end
