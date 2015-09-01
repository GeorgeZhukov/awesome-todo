require 'rails_helper'

RSpec.describe AttachedFilesController, type: :controller do
  login_user

  describe "GET #index" do
    it "assigns @attached_files" do
      project = create :project, user: @user
      task = create :task, project: project
      comment = create :comment, task: task

      get :index, format: :json, comment_id: comment.id
      expect(assigns(:attached_files)).not_to be_nil
    end
  end
end
