class Task < ActiveRecord::Base
  belongs_to :project
  has_many :comments, dependent: :destroy

  default_scope { order(position: :asc) }

  validates :title, presence: true
  validates :project, presence: true
end
