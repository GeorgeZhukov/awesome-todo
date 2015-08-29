class Task < ActiveRecord::Base
  belongs_to :project

  validates :title, presence: true
  validates :project, presence: true
end
