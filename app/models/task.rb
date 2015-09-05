class Task < ActiveRecord::Base
  belongs_to :project
  has_many :comments, dependent: :destroy

  default_scope { order(position: :asc) }

  validates :title, presence: true
  validates :project, presence: true

  before_save do
    init_position
    init_deadline
  end

  private
  def init_position
    unless self.position
      self.position = self.project.tasks.minimum(:position) || 0
      self.position -= 1 # Move up
    end
  end

  def init_deadline
    unless self.deadline
      self.deadline = DateTime.now + 5.days
    end
  end

end
