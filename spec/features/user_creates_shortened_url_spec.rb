# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User creates shortened URL' do
  it "creating and viewing shortened URL" do
    login_as create(:user)

    visit new_shortened_url_path
    fill_in "Url", with: "http://www.example.com"
    click_on "Create Shortened url"

    expect(page).to have_content 'New URL created!'
    expect(page).to have_content 'http://www.example.com'
  end

  it "trying to create a record with invalid url" do
    login_as create(:user)

    visit new_shortened_url_path
    fill_in "Url", with: "invalid_url"
    click_on "Create Shortened url"

    expect(page).not_to have_content 'New URL created!'
    expect(page).to have_content 'is not a valid URL'
  end
end
