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
    find(:css, ".new-task input").set(task_attrs[:title])
    click_button "Add task"
    expect(page).to have_content task_attrs[:title]
  end

  scenario "A user can remove the task" do
    login(user)

    find(".task-buttons").first(".fa-trash").click
    expect(page).not_to have_content task.title
  end
end
