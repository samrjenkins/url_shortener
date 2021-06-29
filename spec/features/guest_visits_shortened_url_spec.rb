# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User views shortened URLs' do
  it "redirects to login page" do
    visit shortened_urls_path

    expect(page).to have_current_path new_user_session_path
  end
end
