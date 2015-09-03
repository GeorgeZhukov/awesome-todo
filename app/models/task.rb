class Task < ActiveRecord::Base
  belongs_to :project
  has_many :comments, dependent: :destroy

  default_scope { order(position: :asc) }

  validates :title, presence: true
  validates :project, presence: true

  before_save do
    unless self.position
      self.position = self.project.tasks.minimum(:position) || 0
      self.position -= 1 # Move up
    end
  end
end
