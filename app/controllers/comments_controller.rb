class CommentsController < ApplicationController
  load_and_authorize_resource :task
  load_and_authorize_resource through: :task

  def index
  end

  def create
    comment = @task.comments.create(comment_params)
    redirect_to task_path(@task, format: :json)
  end

  def destroy
    @comment.destroy
    render json: { nothing: true }
  end

  private
  def comment_params
    params.permit(:text)
  end
end