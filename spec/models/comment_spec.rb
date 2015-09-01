require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should validate_presence_of :text }
  it { should belong_to :task }
  it { should have_many(:attached_files).dependent(:destroy) }
end
