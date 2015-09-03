require 'rails_helper'

RSpec.feature "AttachedFiles", type: :feature, js: true do
  include FeatureHelper

  given!(:user) { create :user }
  given!(:project) { create :project, user: user }
  given!(:task) { create :task, project: project }
  given!(:comment) { create :comment, task: task }
  given!(:attached_file) { create :attached_file, comment: comment }

  scenario "A user can see attached files" do
    login(user)
    expect(page).to have_content attached_file.attachment_identifier
  end
end
