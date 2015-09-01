require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  login_user

  let(:project) { create :project, user: @user }
  let(:task) { create :task, project: project }

  describe "GET #index" do
    it "assigns @comments" do
      get :index, format: :json, task_id: task.id
      expect(assigns(:comments)).not_to be_nil
    end
  end

  xdescribe "POST #index" do
    it "creates a new comment" do
      comment = attributes_for :comment
      post :index, format: :json, task_id: task.id, text: comment[:text]
      expect(Comment.last.text).to eq comment[:text]
    end
  end

  xdescribe "DELETE" do
    it "deletes the comment" do
      comment = create :comment, task: task
      delete :destroy, format: :json, task_id: task.id
      expect(Comment.count).to be_zero
    end
  end
end
