class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :populate_sidebar
  before_filter :get_locale
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end


  def get_locale 
    if params[:locale]
      session[:locale] = params[:locale]
    end
    
    if session[:locale].blank?
      available  = %w{en et ru}
      I18n.locale = request.preferred_language_from(available)
    else
      I18n.locale = session[:locale]
    end
  end
  
  def home
    @carousels = Carousel.published.order(:sort_order)
  end

  def populate_sidebar
    @sidebar_events = Event.published.order('start_at desc').limit(3)
    @sidebar_post = Post.news.merge(Post.published).limit(1)
    if @sidebar_post.empty?
      @sidebar_post = Post.blog.merge(Post.published).limit(1)
    end
    @sidebar_post = @sidebar_post.first
  end

end
