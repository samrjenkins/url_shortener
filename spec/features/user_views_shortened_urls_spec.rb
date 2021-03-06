# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User views shortened URLs' do
  it "lists user's shortened URLs when user has generated some" do
    user = create(:user)
    create(:shortened_url, url: 'http://www.example.com', owner: user)
    login_as user

    visit shortened_urls_path

    expect(page).to have_content 'http://www.example.com'
  end

  it 'displays the use count for each shortened URL' do
    user = create(:user)
    shortened_url = create(:shortened_url, url: 'http://www.example.com', owner: user)
    login_as user

    visit shortened_urls_path

    expect(page).to have_content 'Use count: 0'

    visit short_url(shortened_url)
    visit shortened_urls_path

    expect(page).to have_content 'Use count: 1'
  end

  it 'shows empty state when user has generated no shortened URLs' do
    login_as create(:user)

    visit shortened_urls_path

    expect(page).to have_content 'No URLs to display.'
  end

  it 'does not show shortened URLs belonging to other users' do
    other_user = create(:user)
    create(:shortened_url, url: 'http://www.dont_show_this_url.com', owner: other_user)
    login_as create(:user)

    visit shortened_urls_path

    expect(page).not_to have_content 'http://www.dont_show_this_url.com'
  end
end
