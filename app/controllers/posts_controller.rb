class PostsController < InheritedResources::Base
  actions :index, :show, :news, :blog

  def blog
    @posts = Post.blog.published.order('posted_at DESC').page(params[:page])
    @title = t(:blog)
    render template: 'posts/index'
  end

  def news
    @posts = Post.news.published.order('posted_at DESC').page(params[:page])
    @title = t(:news)
    render template: 'posts/index'
  end

  protected

  def collection
    @posts ||= end_of_association_chain.paginate(:page => params[:page])
  end

end
