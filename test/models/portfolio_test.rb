require 'test_helper'

class PortfolioTest < ActiveSupport::TestCase
  fixtures :portfolios

  test "portfolio title, name, job, overview, email, address, and address_line1 must not be empty" do
    portfolio = Portfolio.new
    assert portfolio.invalid?
    assert portfolio.errors[:title].any?
    assert portfolio.errors[:name].any?
    assert portfolio.errors[:job].any?
    assert portfolio.errors[:overview].any?
    assert portfolio.errors[:email].any?
    assert portfolio.errors[:address].any?
    assert portfolio.errors[:address_line1].any?
  end

  test "portfolio title, name, job, address, and address_line1 must have minimum 6 characters" do
    portfolio = Portfolio.new(title: 'qwert', name: 'qwert', job: 'qwert', email: 'qwert', address: 'qwert', address_line1: 'qwert')
    assert portfolio.invalid?
    assert portfolio.errors[:title].any?
    assert portfolio.errors[:name].any?
    assert portfolio.errors[:job].any?
    assert portfolio.errors[:address].any?
    assert portfolio.errors[:address_line1].any?
  end

  test "portfolio description must have maximum 255 characters" do
    portfolio = Portfolio.new(description: 'Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum.')
    assert portfolio.invalid?
    assert portfolio.errors[:description].any?
  end

  test "portfolio email must have valid format" do
    portfolio = Portfolio.new(email: 'qwert')
    assert portfolio.invalid?
    assert portfolio.errors[:email].any?
  end

  test "portfolio overview must have minimum 128 characters" do
    portfolio = Portfolio.new(overview: 'qwert')
    assert portfolio.invalid?
    assert portfolio.errors[:overview].any?
  end

  test "portfolio social inclusion only based on SOCIAL constant" do
    portfolio = Portfolio.new(social: 'qwert')
    assert portfolio.invalid?
    assert portfolio.errors[:social].any?
  end

  test "portfolio skills reject if all blank" do
    portfolio = portfolios(:one)
    assert_difference('portfolio.skills.count', 0) do
      portfolio.update(skills_attributes: [])
    end
  end

  test "portfolio projects reject if all blank" do
    portfolio = portfolios(:one)
    assert_difference('portfolio.projects.count', 0) do
      portfolio.update(projects_attributes: [])
    end
  end
end
