require 'rails_helper'

RSpec.feature "Comments", type: :feature, js: true do
  include FeatureHelper

  given(:user) { create :user }
  given!(:project) { create :project, user: user }
  given!(:task) { create :task, project: project }

  before do
    login(user)
  end

  scenario "A user can add comment to task" do
    comment_attrs = attributes_for :comment

    click_button "Add comment"
    fill_in "Comment text", with: comment_attrs[:text]
    click_button "Add comment"

  end

  scenario "A user can remove comment" do
    comment = create :comment, task: task
    find(".comment-buttons").first(".fa-times").click
    expect(page).not_to have_content comment.text
  end

  scenario "A user can update comment"
end
