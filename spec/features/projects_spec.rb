require 'rails_helper'

RSpec.feature "Projects", type: :feature, js: true do
  given(:user) { create :user }
  given!(:project) { create :project, user: user }

  scenario "A user can see the list of projects" do
    visit '/#/sign-in'
    within "#sign-in-form" do
      fill_in "E-mail", with: user.email
      fill_in "Password", with: "password"
      click_button "Sign In"
    end

    expect(page).to have_content project.title
  end

  scenario "A user can create a new project" do
    visit '/#/sign-in'
    within "#sign-in-form" do
      fill_in "E-mail", with: user.email
      fill_in "Password", with: "password"
      click_button "Sign In"
    end

    click_button "Add a new project"
    project_attrs = attributes_for :project
    fill_in "Project title", with: project_attrs[:title]
    click_button "Create"
    expect(page).to have_content "The project has been successfully created."
  end


  scenario "A user can update the project title"

  scenario "A user can remove the project" do
    visit '/#/sign-in'
    within "#sign-in-form" do
      fill_in "E-mail", with: user.email
      fill_in "Password", with: "password"
      click_button "Sign In"
    end
    # create :project, user: user
    click_button "Remove project"
    expect(page).to have_content "The project has been successfully removed."
  end
end
