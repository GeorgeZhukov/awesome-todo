class TasksController < ApplicationController

  load_and_authorize_resource :project
  load_and_authorize_resource through: :project, shallow: true

  def index
    render json: @tasks
  end

  def show
    render json: @task
  end

  def update
    @task.update_attributes(task_params)
    render json: { nothing: true }
  end

  def create
    @task = @project.tasks.create(task_params)
    redirect_to project_tasks_path(@project, format: :json)
  end

  def destroy
    @task.destroy
    render json: { nothing: true }
  end

  private
  def task_params
    params.permit(:title, :position, :project_id, :done)
  end
end
