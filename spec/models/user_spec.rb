require 'rails_helper'

RSpec.describe User, type: :model do
  subject { create :user }
  it { should have_many(:projects).dependent(:destroy) }

  describe "#get_image" do
    it "returns image value if not nil" do
      subject.image = "some url"
      expect(subject.get_image).to eq "some url"
    end

    it "returns gravatar url if image is nil" do
      expect(subject.get_image).to match /gravatar/
    end
  end
end
