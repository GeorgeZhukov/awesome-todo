class AttachedFilesController < ApplicationController

  load_and_authorize_resource :comment
  load_and_authorize_resource through: :comment

  def index
  end

  def create

  end
end
