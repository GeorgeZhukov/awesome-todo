class AttachedFileSerializer < ActiveModel::Serializer
  attributes :id, :attachment_url, :attachment_identifier
end
