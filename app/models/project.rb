class Project < ActiveRecord::Base
  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates :title, presence: true
  validates :user, presence: true

  default_scope { order(position: :asc ) }

  before_save do
    unless position
      self.position = Project.minimum(:position) || 0
      self.position -= 1 # Move up
    end
  end

  def to_builder
    Jbuilder.new do |project|
      project.(self, :id, :title, :position)
      project.tasks tasks do |task|
        project.task = task.to_builder
      end
    end

  end
end
