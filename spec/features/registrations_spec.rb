require 'rails_helper'

RSpec.feature "Registrations", type: :feature, js: true do
  scenario "A guest can sign up using email and password" do
    user_data = attributes_for :user
    visit '/#/sign-up'
    fill_in "E-mail", with: user_data[:email]
    fill_in "Password", with: "password"
    fill_in "Confirmation", with: "password"
    click_button "Sign Up"
    expect(page).to have_content "You have successfully registered."
  end
end
