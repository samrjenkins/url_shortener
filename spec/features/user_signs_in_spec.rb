# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Guest fills in sign in form' do
  it 'filling in the form with existing user details' do
    create(:user, email: 'address@email.com', password: '12345678')

    visit new_user_session_path

    fill_in 'Email', with: 'address@email.com'
    fill_in 'Password', with: '12345678'
    click_on 'Log in'

    expect(page).to have_content 'Signed in successfully.'
  end

  it 'filling in the form with non-existent user details' do
    visit new_user_session_path
    click_on 'Log in'

    expect(page).to have_content 'Invalid Email or password.'
  end
end
