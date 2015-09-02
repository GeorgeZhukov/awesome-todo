class Task < ActiveRecord::Base
  belongs_to :project
  has_many :comments, dependent: :destroy

  default_scope { order(created_at: :desc) }

  validates :title, presence: true
  validates :project, presence: true
end
