class TasksController < ApplicationController

  load_and_authorize_resource :project
  load_and_authorize_resource :task, through: :project

  def index
  end

  def create
    @task = @project.tasks.create(task_params)
    redirect_to project_tasks_path(@project, format: :json)
  end

  def destroy
    @task.destroy
    # redirect_to project_tasks_path(@project, format: :json)
    render json: { nothing: true }
  end

  private
  def task_params
    params.permit(:title)
  end
end
