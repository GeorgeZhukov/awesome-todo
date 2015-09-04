class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :position, :done

  has_many :comments
end
