class Task < ActiveRecord::Base
  belongs_to :project
  has_many :comments

  validates :title, presence: true
  validates :project, presence: true
end
