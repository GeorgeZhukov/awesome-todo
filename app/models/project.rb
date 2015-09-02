class Project < ActiveRecord::Base
  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates :title, presence: true
  validates :user, presence: true

  default_scope { order(position: :asc ) }
end
