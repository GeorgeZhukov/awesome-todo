require 'rails_helper'

RSpec.describe AttachedFile, type: :model do
  it { should belong_to :comment }
end
