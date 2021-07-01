# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Shortened URLs show' do
  it 'redirects as determined by matching record' do
    shortened_url = create(:shortened_url, url: 'http://example.com/')

    get short_url(shortened_url)

    expect(response).to redirect_to 'http://example.com/'
  end

  it "redirects to root path for shortened URL which doesn't match record" do
    shortened_url = build(:shortened_url, url: 'http://example.com/', unique_key: 'dummy_key')

    get short_url(shortened_url)

    expect(response).to redirect_to root_path
  end
end
