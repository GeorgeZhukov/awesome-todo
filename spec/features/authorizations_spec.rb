require 'rails_helper'

RSpec.feature "Authorizations", type: :feature, js: true do
  given(:user) { create :user }

  scenario "A user can sign in using email and password" do
    visit '/#/sign-in'
    within "#sign-in-form" do
      fill_in "E-mail", with: user.email
      fill_in "Password", with: "password"
      click_button "Sign In"
    end
    expect(page).to have_content "You have successfully logged in."
  end

  scenario "A user can sign out" do
    visit '/#/sign-in'
    within "#sign-in-form" do
      fill_in "E-mail", with: user.email
      fill_in "Password", with: "password"
      click_button "Sign In"
    end
    expect(page).to have_content "You have successfully logged in."
    click_button "Sign Out"
    expect(page).to have_content "You have logged out."
  end
end
