class AttachedFile < ActiveRecord::Base
  belongs_to :comment

  mount_uploader :attachment, AttachmentUploader
end
