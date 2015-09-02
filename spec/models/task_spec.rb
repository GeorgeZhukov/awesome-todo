require 'rails_helper'

RSpec.describe Task, type: :model do
  it { should validate_presence_of :project }
  it { should validate_presence_of :title }
  it { should have_many(:comments).dependent(:destroy) }

  describe "default scope" do

    it "returns tasks in DESC order" do
      task1 = create :task
      task2 = create :task
      expect(Task.all).to eq [task2, task1]
    end
  end
end
