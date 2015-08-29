require 'rails_helper'

RSpec.feature "Projects", type: :feature, js: true do
  given(:user) { create :user }

  scenario "A user can see the list of projects" do
    project = create :project, user: user
    visit '/#/sign-in'
    within "#sign-in-form" do
      fill_in "E-mail", with: user.email
      fill_in "Password", with: "password"
      click_button "Sign In"
    end
        
    expect(page).to have_content project.title
  end

  scenario "A user can create a new project"
  scenario "A user can update the project title"
  scenario "A user can remove the project"
end
