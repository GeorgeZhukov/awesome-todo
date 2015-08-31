class TasksController < ApplicationController

  load_and_authorize_resource :project
  load_and_authorize_resource :task, through: :project

  def index
  end
end
