require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  login_user
  can_manage_all


  describe "GET #index" do
    it "assigns @projects" do
      get :index, format: :json
      expect(assigns(:projects)).not_to be_nil
    end

    context "cancan doesn't allow index" do
      before do
        @ability.cannot :read, Project
        get :index, format: :json
      end

      it { expect(response).to be_forbidden }
    end
  end

  describe "POST #create" do
    let(:project) { attributes_for :project }

    it "creates a new project" do
      post :create, format: :json, **project
      expect(Project.where(title: project[:title]).count).to be 1
    end

    context "cancan doesn't allow create" do
      before do
        @ability.cannot :create, Project
        post :create, format: :json, **project
      end

      it { expect(response).to be_forbidden }
    end

  end

  describe "PATCH #update" do
    let(:project) { create :project, user: @user }
    let(:project_attrs) { attributes_for :project }

    it "updates the project" do
      patch :update, format: :json, id: project.id, **project_attrs
      expect(Project.where(title: project_attrs[:title]).count).to be 1
    end

    context "cancan doesn't allow update" do
      before do
        @ability.cannot :update, Project
        patch :update, format: :json, id: project.id, **project_attrs
      end

      it { expect(response).to be_forbidden }
    end
  end

  describe "DELETE #destroy" do
    let(:project) { create :project, user: @user }

    it "deletes the project" do
      delete :destroy, id: project.id, format: :json
      expect(Project.find_by_id(project.id)).to be_nil
    end

    context "cancan doesn't allow delete" do
      before do
        @ability.cannot :destroy, Project
        delete :destroy, id: project.id, format: :json
      end

      it { expect(response).to be_forbidden }
    end
  end
end
