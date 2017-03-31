class PagesController < ApplicationController
  before_filter :authenticate_user!, only: [:home]

  def home
    @posts = Post.published.recent
  end

  def main
    render layout: 'main'
  end

  def portfolio
    @portfolio = Portfolio.friendly.find('main')
    render layout: 'portfolio'
  end

  def blog
    @q = Post.published.ransack(params[:q])
    result = @q.result
    @posts = result.page params[:page]
    render layout: 'blog'
  end

  def blog_post
    @q = Post.published.ransack(params[:q])
    @post = Post.friendly.find(params[:id])
    @posts = @q.result
    render layout: 'blog'
  end
end
