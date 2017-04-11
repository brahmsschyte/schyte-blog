require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should get root" do
    get root_url
    assert_response :success
  end

  test "should get home" do
    get home_url
    assert_response :redirect
    sign_in users(:one)
    get home_url
    assert_response :success
  end

  test "should get main" do
    get main_url
    assert_response :success
  end

  test "should get portfolio" do
    get portfolio_url
    assert_response :success
  end

  test "should get blog" do
    get blog_url
    assert_response :success
  end

  test "should get blog post" do
    get blog_post_url(posts(:one))
    assert_response :success
  end
end
