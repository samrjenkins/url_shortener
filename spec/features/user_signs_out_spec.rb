require "rails_helper"

RSpec.feature "User signs out" do
  scenario "clicking on Sign out link" do
    login_as create(:user)
    visit root_path

    click_on 'Sign out'

    expect(page).to have_content 'Signed out successfully.'
    expect(page).to_not have_link 'Sign out'
  end
end
