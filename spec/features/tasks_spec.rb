require 'rails_helper'

RSpec.feature "Tasks", type: :feature, js: true do
  include FeatureHelper

  given(:user) { create :user }
  given!(:project) { create :project, user: user }
  given!(:task) { create :task, project: project }

  scenario "A user can see tasks associated with project" do
    login(user)

    expect(page).to have_content task.title
  end

  scenario "A user can add a new task" do
    login(user)

    task_attrs = attributes_for :task
    fill_in "New task", with: task_attrs[:title]
    click_button "Add"
    expect(page).to have_content task_attrs[:title]
  end

  scenario "A user can remove the task" do
    login(user)

    click_button "Remove"
    expect(page).not_to have_content task.title
  end
end
