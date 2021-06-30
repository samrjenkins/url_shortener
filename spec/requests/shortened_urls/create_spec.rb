require "rails_helper"

RSpec.describe "Shortened URLs create" do
  it "creates ShortenedUrl record" do
    params = { shortened_url: { url: "www.example.com" } }

    login_as create(:user)

    expect { post shortened_urls_path, params: params }.to change(ShortenedUrl, :count).by 1
  end

  it 'redirects unathorised user to login' do
    post shortened_urls_path

    expect(response).to redirect_to new_user_session_path
  end
end
