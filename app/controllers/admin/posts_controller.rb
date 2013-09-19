class Admin::PostsController < Admin::BaseController
  prepend_before_filter :find_post, :only => [:update, :edit, :destroy, :show]

  def new
    @post = Post.new(:user_id => current_user.id)
    # @post.build_carousel
  end
  
  def index
    @posts = Post.includes([:postcategory, :images]).order('posted_at DESC').page(params[:page]).per(25)

  end
  
  protected

  def permitted_params
    params.permit(:post => [ :user_id, :is_personal, :sticky, :event_id, :published, :slug, 
      :postcategory_id,  :carousel, :remove_carousel,
      carousels_attributes: [:carousel_image, :_destroy, :active, :id],
      images_attributes:  [:attachable_id, :_destroy, :id,  :attachable_type, :filename, :credit, :published, 
        translations_attributes: [:id, :locale, :caption]
        ],
      translations_attributes: [ :title, :body, :id, :locale]])
  end

  private

  def find_post
    @post = Post.friendly.find(params[:id])
  end

end
