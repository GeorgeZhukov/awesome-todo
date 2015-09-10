require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  login_user
  can_manage_all

  let(:project) { create :project, user: @user }
  let(:task) { create :task, project: project }
  let!(:comment) { create :comment, task: task }


  describe "GET #index" do
    it "assigns @comments" do
      get :index, format: :json, task_id: task.id
      expect(assigns(:comments)).not_to be_nil
    end

    context "cancan doesn't allow index" do
      before do
        @ability.cannot :read, Comment
        get :index, format: :json, task_id: task.id
      end

      it { expect(response).to be_forbidden }
    end
  end

  describe "GET #show" do
    it "assigns @comment" do
      get :show, id: comment.id
      expect(assigns(:comment)).not_to be_nil
    end

    context "cancan doesn't allow show" do
      before do
        @ability.cannot :read, Comment
        get :show, id: comment.id
      end

      it { expect(response).to be_forbidden }
    end
  end

  describe "PATCH #update" do
    let(:comment_attrs) { attributes_for :comment}

    it "updates model" do
      patch :update, id: comment.id, text: comment_attrs[:text]
      expect(Comment.find(comment.id).text).to eq comment_attrs[:text]
    end

    context "cancan doesn't allow patch" do
      before do
        @ability.cannot :update, Comment
        patch :update, id: comment.id, text: comment_attrs[:text]
      end

      it { expect(response).to be_forbidden }
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

    context "cancan doesn't allow create" do
      before do
        @ability.cannot :create, Comment
        post :create, task_id: task.id, text: comment[:text]
      end

      it { expect(response).to be_forbidden }
    end
  end

  describe "DELETE #destroy" do
    it "deletes the comment" do
      delete :destroy, id: comment.id
      expect(Comment.count).to be_zero
    end

    context "cancan doesn't allow destroy" do
      before do
        @ability.cannot :destroy, Comment
        delete :destroy, id: comment.id
      end

      it { expect(response).to be_forbidden }
    end
  end
end
