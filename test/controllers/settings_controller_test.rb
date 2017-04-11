require 'test_helper'

class SettingsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
    @global_setting = settings(:global)
    @social_setting = settings(:social)
  end

  test "deny access non admin" do
    sign_out users(:one)
    sign_in users(:two)
    get edit_setting_url('global')
    assert_response :redirect
    get edit_setting_url('social')
    assert_response :redirect
  end

  test "should get edit" do
    get edit_setting_url('global')
    assert_response :success
    get edit_setting_url('social')
    assert_response :success
  end

  test "should update setting" do
    patch setting_url('global'), params: { setting: { config: [site_title: @global_setting.config['site_title']] } }
    assert_redirected_to edit_setting_url('global')
    patch setting_url('social'), params: { setting: { config: [email: @social_setting.config['email']] } }
    assert_redirected_to edit_setting_url('social')
  end
end
