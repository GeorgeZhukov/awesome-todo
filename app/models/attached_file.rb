class AttachedFile < ActiveRecord::Base
  belongs_to :comment

  mount_uploader :attachment, AttachmentUploader

  def to_builder
    Jbuilder.new do |attached_file|
      attached_file.(self, :id, :attachment_url, :attachment_identify)
    end
  end
end
