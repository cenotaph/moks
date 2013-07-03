class Admin::EventsController < Admin::BaseController

  prepend_before_filter :find_event, :only => [:show, :edit, :update, :destroy]

   def create
    create! { admin_events_path }
  end

  def update
    update! { admin_events_path }
  end

  def destroy
    destroy! { admin_events_path }
  end

  private

  def find_event
    @event = Event.friendly.find(params[:id])
  end
  
  protected

  def permitted_params    
    params.permit(:event => [:start_at, :end_at, :images_attributes, :project_ids, 
      :promoter, :cost, 
      :discounted_cost, :discount_reason, :register_through_project, :registration_required, 
      :registration_limit, :registration_recipient, :registration_optional_q, :hide_registrants, 
      :avatar, :location_id, :donations_requested, :published, :slug,   
      :remove_carousel,
      carousels_attributes: [:carousel_image, :_destroy, :active, :id],

      sounds_attributes: [:soundcloud_id, :_destroy, :filename, :id, :event_id, :published, 
       translations_attributes: [:id, :locale, :name, :description ]
      ], 
      project_ids: [ ],
      videos_attributes: [:videohost_id, :event_id, :id, :provider_id_code, :published, 
        translations_attributes: [:id, :_destroy, :video_id, :locale, :name, :description ]
      ],
      translations_attributes: [:id, :locale, :name, :notes, :description],
      images_attributes: [:attachable_id, :_destroy, :id,  :attachable_type, :filename, :credit, :published, 
        translations_attributes: [:id, :locale, :caption]
        ],
      ])
  end      

end
