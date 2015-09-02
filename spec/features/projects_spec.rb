require 'rails_helper'

RSpec.feature "Projects", type: :feature, js: true do
  include FeatureHelper

  given(:user) { create :user }
  given!(:project) { create :project, user: user }

  before do
    login(user)
  end

  scenario "A user can see the list of projects" do
    expect(page).to have_content project.title
  end

  scenario "A user can create a new project" do
    click_button "Add a new project"
    project_attrs = attributes_for :project
    fill_in "Project title", with: project_attrs[:title]
    click_button "Create"
    expect(page).to have_content "The project has been successfully created."
  end


  scenario "A user can update the project title"

  scenario "A user can remove the project" do
    find(".project-buttons").first(".fa-trash").click
    expect(page).to have_content "The project has been successfully removed."
  end
end
