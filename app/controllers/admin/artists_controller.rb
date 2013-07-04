class Admin::ArtistsController < Admin::BaseController
  
  prepend_before_filter :find_artist, :only => [:show, :edit, :update, :destroy]

  def index
    @artists = Artist.includes(:visits).order('visits.start_date DESC')
  end

  def create
    create! { admin_artists_path }
  end

  def update
    update! { admin_artists_path }
  end

  def destroy
    destroy! { admin_artists_path }
  end

  private

  def find_artist
    @artist = Artist.friendly.find(params[:id])
  end
  
  protected

  def permitted_params    
    params.permit(:artist => [:name, :website1, 
      :website2, :website3, :avatar, :slug, :email,
      visits_attributes: [:start_date, :id, :artist_id, :_destroy,
                            :end_date, :is_rental, :project_id, :residencytype_id, :published, 
                            :remove_carousel,
                           carousels_attributes: [:carousel_image, :_destroy, :active, :id],
                           funder_ids: [ ],
                           event_ids: [ ],

                           images_attributes: [:attachable_id, :_destroy, :id,  :attachable_type, 
                                               :filename, :credit, :published, 
                                               translations_attributes: [:id, :locale, :caption]
                                              ],
                           translations_attributes: [:id, :locale, :description ]
                          ],
      translations_attributes: [:id, :locale, :bio ]
      ])
  end      

end
