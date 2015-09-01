class AddAttachmentToAttachedFiles < ActiveRecord::Migration
  def change
    add_column :attached_files, :attachment, :string
  end
end
