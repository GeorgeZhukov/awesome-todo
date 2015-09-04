class ProjectsController < ApplicationController
  load_and_authorize_resource

  def index
    render json: @projects
  end

  def show
    render json: @project
  end

  def update
    @project.update_attributes(project_params)
    render json: { nothing: true }
  end

  def create
    @project = current_user.projects.create(project_params)
    redirect_to project_path(@project, format: :json)
  end

  def destroy
    @project.destroy
    render json: { nothing: true }
  end

  private
  def project_params
    params.permit(:title, :position)
  end
end
