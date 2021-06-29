# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User views shortened URLs' do
  it 'lists shortened URLs when user has generated some' do
    create(:shortened_url, url: "www.example.com")

    visit shortened_urls_path

    expect(page).to have_content 'www.example.com'
  end

  it 'shows empty state when user has generated no shortened URLs' do
    visit shortened_urls_path

    expect(page).to have_content 'No URLs to display.'
  end
end
