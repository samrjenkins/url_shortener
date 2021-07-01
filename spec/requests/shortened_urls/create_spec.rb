require "rails_helper"

RSpec.describe "Shortened URLs create" do
  subject { post shortened_urls_path, params: params }

  context "when logged in" do
    before { login_as create(:user) }

    context 'when url is valid' do
      let(:params) { { shortened_url: { url: "http://www.example.com" } } }

      it 'creates a ShortenedUrl record' do
        expect { subject }.to change(ShortenedUrl, :count).by 1
      end
    end

    context 'when url is invalid' do
      let(:params) { { shortened_url: { url: "invalid_url" } } }

      it 'does not create a ShortenedUrl record' do
        expect { subject }.not_to change(ShortenedUrl, :count)
      end

      it 'responds with 422' do
        subject

        expect(response).to have_http_status 422
      end
    end
  end

  context "when not logged in" do
    it 'redirects unathorised user to login' do
      post shortened_urls_path

      expect(response).to redirect_to new_user_session_path
    end
  end
end
