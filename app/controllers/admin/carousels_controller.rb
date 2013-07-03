class Admin::CarouselsController < Admin::BaseController
  
  def index
    @published = Carousel.published
    @unpublished = Carousel.unpublished
  end

  def sort
    @carousels = Carousel.all
    @carousels.each do |c|
      c.sort_order = params['carousel'].index(c.id.to_s) + 1
      c.save
    end
  end

  def toggle_published
    @carousel = Carousel.find(params[:id])
    @carousel.toggle!(:active)
    redirect_to admin_carousels_path
  end

  protected

  def permitted_params
    params.permit(:post => [ :user_id, :is_personal, :sticky, :event_id, :published, :slug, 
      :postcategory_id,  :carousel, :remove_carousel,
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
