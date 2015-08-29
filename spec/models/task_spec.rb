require 'rails_helper'

RSpec.describe Task, type: :model do
  it { should validate_presence_of :project }
  it { should validate_presence_of :title }
end
