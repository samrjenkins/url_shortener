# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User signs out' do
  it 'clicking on Sign out link' do
    login_as create(:user)
    visit root_path

    click_on 'Sign out'

    expect(page).to have_content 'Signed out successfully.'
  end
end
