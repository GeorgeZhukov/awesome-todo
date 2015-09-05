require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  login_user

  let(:project) { create :project, user: @user }
  let(:task) { create :task, project: project }
  let!(:comment) { create :comment, task: task }

  describe "GET #index" do
    it "assigns @comments" do
      get :index, format: :json, task_id: task.id
      expect(assigns(:comments)).not_to be_nil
    end
  end

  describe "GET #show" do
    it "assigns @comment" do
      get :show, id: comment.id
      expect(assigns(:comment)).not_to be_nil
    end
  end

  describe "POST #create" do
    before do
      comment = attributes_for :comment
      post :create, task_id: task.id, text: comment[:text]
    end

    it "creates a new comment" do
      expect(Comment.where(text: comment[:text]).count).to eq 1
    end

    it "redirects to new comment" do
      expect(response).to redirect_to comment_path(Comment.last, format: :json)
    end
  end

  describe "DELETE #destroy" do
    it "deletes the comment" do
      delete :destroy, id: comment.id
      expect(Comment.count).to be_zero
    end
  end
end
