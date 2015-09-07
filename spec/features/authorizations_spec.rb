require 'rails_helper'

RSpec.feature "Authorizations", type: :feature, js: true do
  include FeatureHelper

  scenario "A user can sign in using email and password" do
    login
    expect(page).to have_content "You have successfully logged in by email."
  end

  scenario "A user can sign out" do
    login
    expect(page).to have_content "You have successfully logged in by email."
    click_link "Sign out"
    expect(page).to have_content "You have logged out."
  end
end
