require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  describe "GET #index" do
    it "assigns @projects" do
      get :index, format: :json
      expect(assigns(:projects)).not_to be_nil
    end
  end
end
