require 'rails_helper'

RSpec.feature "Tasks", type: :feature, js: true do
  given(:user) { create :user }
  given!(:project) { create :project, user: user }
  given!(:task) { create :task, project: project }

  scenario "A user can see tasks associated with project" do
    visit '/#/sign-in'
    within "#sign-in-form" do
      fill_in "E-mail", with: user.email
      fill_in "Password", with: "password"
      click_button "Sign In"
    end

    expect(page).to have_content task.title
  end

  scenario "A user can add a new task" do
    visit '/#/sign-in'
    within "#sign-in-form" do
      fill_in "E-mail", with: user.email
      fill_in "Password", with: "password"
      click_button "Sign In"
    end

    task_attrs = attributes_for :task
    fill_in "New task", with: task_attrs[:title]
    click_button "Add"
    expect(page).to have_content task_attrs[:title]
  end

  scenario "A user can remove the task" do
    visit '/#/sign-in'
    within "#sign-in-form" do
      fill_in "E-mail", with: user.email
      fill_in "Password", with: "password"
      click_button "Sign In"
    end

    click_button "Remove"
    expect(page).not_to have_content task.title
  end
end
