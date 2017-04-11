module PagesHelper
  def blog_cover_from_posts(posts)
    if posts.empty?
      image_tag('blog_cover.png', id: 'cover-image', class: 'ui fluid image')
    else
      image = posts.order('RANDOM()').last.featured_image.cover.url
      image_tag(image, id: 'cover-image', class: 'ui fluid image')
    end
  end
end
