# frozen_string_literal: true

class ShortenedUrlsController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @shortened_urls = current_user.shortened_urls
  end
end
