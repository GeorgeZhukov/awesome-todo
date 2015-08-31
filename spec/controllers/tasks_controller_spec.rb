require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  login_user

  describe "GET #index" do
    it "assigns @tasks" do
      project = create :project, user: @user
      get :index, format: :json, project_id: project.id
      expect(assigns(:tasks)).not_to be_nil
    end
  end
end
