require 'rails_helper'

RSpec.feature "Comments", type: :feature, js: true do
  include FeatureHelper

  given(:user) { create :user }
  given(:project) { create :project, user: user }
  given(:task) { create :task, project: project }
  given!(:comment) { create :comment, task: task }

  before do
    login(user)
    find(".fa-comments").click
  end

  scenario "A user can add comment to task" do
    comment_attrs = attributes_for :comment

    click_button "Add comment"
    find(".comments").first("input").set(comment_attrs[:text])
    click_button "Add comment"
  end

  scenario "A user can remove comment" do
    find(".comment-buttons").first(".fa-times").click
    expect(page).not_to have_content comment.text
  end

  scenario "A user can update comment" do
    comment_attrs = attributes_for :comment
    within "comment" do
      find(".editable").click
      find(:css, ".editable-input").set(comment_attrs[:text])
      find(".glyphicon-ok").click
    end
    expect(page).to have_content comment_attrs[:text]
  end
end
