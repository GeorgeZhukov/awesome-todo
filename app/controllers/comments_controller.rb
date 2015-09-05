class CommentsController < ApplicationController
  load_and_authorize_resource :task
  load_and_authorize_resource through: :task, shallow: true

  def index
    render json: @comments
  end

  def show
    render json: @comment
  end

  def update
    @comment.update_attributes(comment_params)
    render json: @comment
  end

  def create
    comment = @task.comments.create(comment_params)
    redirect_to comment_path(comment, format: :json)
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
