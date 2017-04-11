require 'test_helper'

class SettingTest < ActiveSupport::TestCase
  fixtures :settings

  test "setting config, title, and footer must not be empty" do
    setting = Setting.new(name: 'Global')
    assert setting.invalid?
    assert setting.errors[:config].any?
    setting = Setting.new(name: 'Global', config: [:site_title, :site_footer])
    assert setting.invalid?
    assert setting.errors[:site_title].any?
    assert setting.errors[:site_footer].any?
  end
end