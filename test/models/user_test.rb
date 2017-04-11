require 'test_helper'

class UserTest < ActiveSupport::TestCase
  fixtures :users

  test "user name, title, and email must not be empty" do
    user = User.new
    assert user.invalid?
    assert user.errors[:name].any?
    assert user.errors[:title].any?
    assert user.errors[:email].any?
  end

  test "user name must have minimum 6 characters" do
    user = User.new(name: 'qwert')
    assert user.invalid?
    assert user.errors[:name].any?
  end

  test "user title inclusion only based on TITLE constant" do
    user = User.new(title: 'qwert')
    assert user.invalid?
    assert user.errors[:title].any?
  end

  test "user email must be unique and follow proper format" do
    user = User.new(email: 'qwert')
    assert user.invalid?
    assert user.errors[:email].any?
    user = User.new(email: 'admin@example.com')
    assert user.invalid?
    assert user.errors[:email].any?
  end

  test "user password must not be empty, have minimum 8 characters and have confirmation on create" do
    user = User.new
    assert user.invalid?
    assert user.errors[:password].any?
    user = User.new(password: 'qwert')
    assert user.invalid?
    assert user.errors[:password].any?
    user = User.new(password: 'qwert123', password_confirmation: '')
    assert user.invalid?
    assert_not user.errors[:password].any?
    assert user.errors[:password_confirmation].any?
  end

  test "user password could be empty, have minimum 8 characters and have confirmation on update" do
    user = users(:two)
    assert user.update(telegram: 'qwert')
    assert_not user.update(password: 'qwert')
    assert_not user.update(password: 'qwert123', password_confirmation: '')
  end

  test "user check for admin privilege" do
    assert users(:one).admin?
    assert_not users(:two).admin?
  end
end
