# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Guest fills in sign up form' do
  it 'filling in the form with valid details' do
    visit new_user_registration_path

    fill_in 'Email', with: 'address@email.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    click_on 'Sign up'

    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  it 'filling in the form with invalid details' do
    visit new_user_registration_path
    click_on 'Sign up'

    expect(page).to have_content 'errors prohibited this user from being saved'
  end
end
