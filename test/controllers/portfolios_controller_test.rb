require 'test_helper'

class PortfoliosControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
    @portfolio = portfolios(:one)
  end

  test "should show portfolio" do
    get profile_url(@portfolio)
    assert_response :success
  end

  test "should get edit" do
    get edit_profile_url(@portfolio)
    assert_response :success
  end

  test "should update portfolio" do
    patch profile_url(@portfolio), params: { portfolio: { title: @portfolio.title } }
    assert_redirected_to profile_url(Portfolio.last)
  end
end
