# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Shortened URLs show' do
  subject(:get_request) { get short_url(shortened_url) }

  context 'when request matches record' do
    let(:shortened_url) { create(:shortened_url, url: 'http://example.com/') }

    it 'redirects as determined by matching record' do
      get_request

      expect(response).to redirect_to 'http://example.com/'
    end
  end

  context 'when request does not match record' do
    let(:shortened_url) { build(:shortened_url, url: 'http://example.com/', unique_key: 'dummy_key') }

    it "redirects to root path for shortened URL which doesn't match record" do
      get_request

      expect(response).to redirect_to root_path
    end
  end
end
