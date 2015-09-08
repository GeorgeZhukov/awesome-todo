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

  xdescribe "POST #index" do
    it "creates a new project" do
      project = attributes_for :project
      post :index, format: :json, project: project
      expect(Project.last.title).to eq project.title
    end
  end
end
