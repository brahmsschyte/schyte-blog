require 'test_helper'

class SkillTest < ActiveSupport::TestCase
  fixtures :skills

  test "skill position, name, and mastery must not be empty" do
    skill = Skill.new
    assert skill.invalid?
    assert skill.errors[:position].any?
    assert skill.errors[:name].any?
    assert skill.errors[:mastery].any?
  end

  test "skill position must be a unique number" do
    skill = Skill.new(position: 'qwert')
    assert skill.invalid?
    assert skill.errors[:position].any?
    skill = Skill.new(position: skills(:one).position)
    assert skill.invalid?
    assert skill.errors[:position].any?
  end

  test "skill name must have minimum 6 characters" do
    skill = Skill.new(name: 'qwert')
    assert skill.invalid?
    assert skill.errors[:name].any?
  end

  test "skill mastery must be a number between 0 and 100" do
    skill = Skill.new(mastery: 'qwe')
    assert skill.invalid?
    assert skill.errors[:mastery].any?
    skill = Skill.new(mastery: -1)
    assert skill.invalid?
    assert skill.errors[:mastery].any?
  end
end
