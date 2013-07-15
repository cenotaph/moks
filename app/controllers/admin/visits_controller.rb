class Admin::VisitsController < Admin::BaseController

  def new
    if params[:artist_id]
      @visit = Visit.new(:artist_id => Artist.friendly.find(params[:artist_id]).id)

    else
      @visit = Visit.new
    end
  end

   def create
    create! { admin_artist_path(@visit.artist) }
  end

  def update
    update! { admin_artist_path(@visit.artist) }
  end

  def destroy
    destroy! { admin_artist_path(@visit.artist) }
  end

  protected

  def permitted_params    
    params.permit(:visit => [:start_date, :id, :artist_id, :_destroy,
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
                          ])
  end  

end
