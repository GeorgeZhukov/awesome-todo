require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  include FeatureHelper

  given(:user) { create :user }
  given!(:project) { create :project, user: user }
  given!(:task) { create :task, project: project }

  xscenario "A user can add comment to task" do
    login

    comment_attrs = attributes_for :comment

    click_button "Add comment"
    fill_in "Comment body", with: comment_attrs.text
    click_button "Save"

  end

  scenario "A user can remove comment"
  scenario "A user can update comment"
end
