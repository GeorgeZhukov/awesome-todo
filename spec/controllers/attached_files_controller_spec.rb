require 'rails_helper'

RSpec.describe AttachedFilesController, type: :controller do
  login_user
  can_manage_all

  let(:project) { create :project, user: @user }
  let(:task) { create :task, project: project }
  let(:comment) { create :comment, task: task }

  describe "GET #index" do
    it "assigns @attached_files" do
      get :index, format: :json, comment_id: comment.id
      expect(assigns(:attached_files)).not_to be_nil
    end

    context "cancan doesn't allow index" do
      before do
        @ability.cannot :read, AttachedFile
        get :index, format: :json, comment_id: comment.id
      end

      it { expect(response).to be_forbidden }
    end
  end

  describe "POST #create" do
    it "creates a new attached file" do
      file = fixture_file_upload('files/example_image.jpg')
      post :create, comment_id: comment.id, file: file
      expect(AttachedFile.count).to eq 1
    end
  end
end
