require "rails_helper"

RSpec.describe "Shortened URLs create" do
  it "creates ShortenedUrl record" do
    user = create(:user)
    shortened_url = create(:shortened_url, owner: user)
    login_as user

    expect { delete shortened_url_path(shortened_url.id) }.to change(ShortenedUrl, :count).by -1
  end

  it 'redirects unathorised user to login' do
    delete shortened_url_path(1)

    expect(response).to redirect_to new_user_session_path
  end
end
