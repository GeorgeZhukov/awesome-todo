class TasksController < ApplicationController
  def index
    @tasks = Project.find(params[:project_id]).tasks
  end
end
