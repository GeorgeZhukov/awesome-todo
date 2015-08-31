require 'rails_helper'
require "cancan/matchers"

describe User do
  describe "abilities" do

    let(:user) { create :user }
    subject { Ability.new user }

    let(:another_user) { create :user }

    context "project" do
      it { should be_able_to :manage, Project.new(user: user) }
      it { should_not be_able_to :manage, Project.new(user: another_user) }
    end

    context "task" do
      let(:project) { create :project, user: user }
      let(:another_project) { create :project, user: another_user}

      it { should be_able_to :manage, Task.new(project: project) }
      it { should_not be_able_to :manage, Task.new(project: another_project) }
    end
  end
end
