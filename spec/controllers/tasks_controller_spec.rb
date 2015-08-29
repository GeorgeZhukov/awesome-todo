require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  describe "GET #index" do
    it "assigns @tasks" do
      project = create :project
      get :index, format: :json, project_id: project.id
      expect(assigns(:tasks)).not_to be_nil
    end
  end
end
