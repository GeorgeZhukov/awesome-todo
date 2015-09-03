class AttachedFilesController < ApplicationController

  load_and_authorize_resource :comment
  load_and_authorize_resource through: :comment

  def index
  end

  def create
    attached_file = @comment.attached_files.create(attachment: params[:file])
    render json: { nothing: true }
  end
end
