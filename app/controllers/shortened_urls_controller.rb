# frozen_string_literal: true

class ShortenedUrlsController < ApplicationController
  before_action :authenticate_user!, only: %i[index new create destroy]

  def index
    @shortened_urls = user_shortened_urls
  end

  def new
    @shortened_url = Shortener::ShortenedUrl.new
  end

  def create
    Shortener::ShortenedUrl.generate(url_param, owner: current_user)
    redirect_to shortened_urls_path, notice: "New URL created!"
  end

  def destroy
    user_shortened_urls.find(params[:id]).destroy
    redirect_to shortened_urls_path, notice: "URL deleted!"
  end

  private

  def url_param
    params[:shortened_url][:url]
  end

  def user_shortened_urls
    current_user.shortened_urls
  end
end
