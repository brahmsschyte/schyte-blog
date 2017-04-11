require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  fixtures :projects

  test "project position, name, timeline, and info must not be empty" do
    project = Project.new
    assert project.invalid?
    assert project.errors[:position].any?
    assert project.errors[:name].any?
    assert project.errors[:timeline].any?
    assert project.errors[:info].any?
  end

  test "project position must be a unique number" do
    project = Project.new(position: 'qwert')
    assert project.invalid?
    assert project.errors[:position].any?
    project = Project.new(position: projects(:one).position)
    assert project.invalid?
    assert project.errors[:position].any?
  end

  test "project name must have minimum 6 characters" do
    project = Project.new(name: 'qwert')
    assert project.invalid?
    assert project.errors[:name].any?
  end

  test "project timeline must have minimum 4 characters" do
    project = Project.new(timeline: 'qwe')
    assert project.invalid?
    assert project.errors[:timeline].any?
  end

  test "project info must have minimum 40 characters" do
    project = Project.new(info: 'qwerty')
    assert project.invalid?
    assert project.errors[:info].any?
  end
end
