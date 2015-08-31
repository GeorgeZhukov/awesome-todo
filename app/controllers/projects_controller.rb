class ProjectsController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def show
  end

  def create
    @project = current_user.projects.create(project_params)
    redirect_to project_path(@project, format: :json)
  end

  private
  def project_params
    params.permit(:title)
  end
end
