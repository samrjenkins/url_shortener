# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User views shortened URLs' do
  it "lists user's shortened URLs when user has generated some" do
    user = create(:user)
    create(:shortened_url, url: "www.example.com", owner: user)
    login_as user

    visit shortened_urls_path

    expect(page).to have_content 'www.example.com'
  end

  it 'shows empty state when user has generated no shortened URLs' do
    login_as create(:user)

    visit shortened_urls_path

    expect(page).to have_content 'No URLs to display.'
  end

  it 'does not show shortened URLs belonging to other users' do
    other_user = create(:user)
    create(:shortened_url, url: "www.dont_show_this_url.com")
    login_as create(:user)

    visit shortened_urls_path

    expect(page).not_to have_content 'www.dont_show_this_url.com'
  end
end
