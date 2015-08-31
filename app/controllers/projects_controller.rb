class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    @project = current_user.projects.create(project_params)
    @project.user = User.first
    @project.save
    redirect_to project_path(@project, format: :json)
  end

  private
  def project_params
    params.permit(:title)
  end
end
