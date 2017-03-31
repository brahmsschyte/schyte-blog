require 'test_helper'

class PostTest < ActiveSupport::TestCase
  fixtures :posts

  test "post title, body, and visibility must not be empty" do
    post = Post.new
    assert post.invalid?
    assert post.errors[:title].any?
    assert post.errors[:body].any?
    assert post.errors[:visibility].any?
  end

  test "post title must have minimum 6 characters" do
    post = Post.new(title: 'qwert')
    assert post.invalid?
    assert post.errors[:title].any?
  end

  test "post body must have minimum 256 characters" do
    post = Post.new(body: 'qwert')
    assert post.invalid?
    assert post.errors[:body].any?
  end

  test "post visibility inclusion only based on VISIBILITY constant" do
    post = Post.new(visibility: 'qwert')
    assert post.invalid?
    assert post.errors[:visibility].any?
  end

  test "post slug should changes if title changes or slug changes" do
    post = Post.first
    slug = post.slug
    post.update(title: 'qwerty')
    assert_not_equal slug, post.slug
    post.update(slug: 'test')
    assert_equal 'test', post.slug
    post.update(slug: nil)
    assert_equal 'qwerty', post.slug
  end

  test "published method should return only posts with draft equal false and published_at date less than or equal today" do
    Post.first.update(draft: false, published_at: Time.zone.now.yesterday)
    assert_equal 1, Post.published.count
  end
end
