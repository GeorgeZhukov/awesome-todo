require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  login_user
  can_manage_all

  describe "GET #index" do
    let(:project) { create :project, user: @user }

    it "assigns @tasks" do
      get :index, format: :json, project_id: project.id
      expect(assigns(:tasks)).not_to be_nil
    end

    context "cancan doesn't allow index" do
      before do
        @ability.cannot :read, Task
        get :index, format: :json, project_id: project.id
      end

      it { expect(response).to be_forbidden }
    end
  end
end
