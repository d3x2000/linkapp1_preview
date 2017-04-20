module ArticlesHelper
  require 'uri'
  def get_host(url)
    uri = URI.parse(url)
    uri = URI.parse("http://#{url}") if uri.scheme.nil?
    host = uri.host.downcase
    host.start_with?('www.') ? host[4..-1] : host
  end

  def get_comments(article)
    comments = Comment.where(article_id: article.id).all.count
  end

  def get_user(article)
    user = User.where(id: article.user_id).first
    user.username
  end

  def get_img(article)
    if article.img == "" or article.img == nil
      img = "thumbnail.png"
    else
      article.img
    end
  end
end
