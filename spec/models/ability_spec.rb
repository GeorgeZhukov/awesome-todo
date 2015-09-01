require 'rails_helper'
require "cancan/matchers"

describe User do
  describe "abilities" do

    let(:user) { create :user }
    subject { Ability.new user }

    let(:another_user) { create :user }
    let(:another_project) { create :project, user: another_user}
    let(:another_task) { create :task, project: another_project }
    let(:another_comment) { create :comment, task: another_task }

    context "project" do
      it { should be_able_to :manage, Project.new(user: user) }
      it { should_not be_able_to :manage, Project.new(user: another_user) }
    end

    context "task" do
      let(:project) { create :project, user: user }

      it { should be_able_to :manage, Task.new(project: project) }
      it { should_not be_able_to :manage, Task.new(project: another_project) }
    end

    context "comment" do
      let(:project) { create :project, user: user }
      let(:task) { create :task, project: project }

      it { should be_able_to :manage, Comment.new(task: task) }
      it { should_not be_able_to :manage, Comment.new(task: another_task) }
    end

    context "attached_file" do
      let(:project) { create :project, user: user }
      let(:task) { create :task, project: project }
      let(:comment) { create :comment, task: task }

      it { should be_able_to :manage, AttachedFile.new(comment: comment) }
      it { should_not be_able_to :manage, AttachedFile.new(comment: another_comment) }
    end
  end
end
