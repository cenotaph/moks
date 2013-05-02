class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :populate_sidebar
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def home

  end

  def populate_sidebar
    @sidebar_events = Event.published.limit(3)
    @sidebar_post = Post.news.published.limit(1)
    if @sidebar_post.empty?
      @sidebar_post = Post.blog.published.limit(1)
    end
    @sidebar_post = @sidebar_post.first
  end

end
