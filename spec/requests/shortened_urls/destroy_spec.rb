# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Shortened URLs create' do
  subject(:delete_request) { delete shortened_url_path(shortened_url.id) }

  context 'when logged in' do
    let(:user) { create(:user) }
    let(:shortened_url) { create(:shortened_url, owner: user) }

    before do
      shortened_url
      login_as user
    end

    it 'destroys ShortenedUrl record' do
      expect { delete_request }.to change(ShortenedUrl, :count).by(-1)
    end
  end

  context 'when not logged in' do
    let(:shortened_url) { build_stubbed(:shortened_url) }

    it 'redirects unathorised user to login' do
      delete_request

      expect(response).to redirect_to new_user_session_path
    end
  end
end
