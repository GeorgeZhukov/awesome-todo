require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  login_user

  describe "GET #index" do
    it "assigns @projects" do
      get :index, format: :json
      expect(assigns(:projects)).not_to be_nil
    end
  end

  describe "POST #index" do
    it "" do
      project = attributes_for :project
      post :index, format: :json, project: project
    end
  end
end
