class Comment < ActiveRecord::Base
  belongs_to :task
  has_many :attached_files, dependent: :destroy

  validates :text, presence: true
  validates :task, presence: true

  def to_builder
    Jbuilder.new do |comment|
      comment.(self, :id, :text)
      comment.attached_files attached_files do |attached_file|
      	comment.attached_file = attached_file.to_builder
      end

    end
  end
end
