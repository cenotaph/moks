class Admin::LocationsController < Admin::BaseController
  def create
    create! { admin_locations_path }
  end

  def update
    update! { admin_locations_path }
  end

  def destroy
    destroy! { admin_locations_path }
  end

  protected

  def permitted_params 
    params.permit(:location => [:address1, :address2, :city, :county, :country, :postcode, 
                                :map_url, translations_attributes: [:id, :locale, :name]
                                ])
  end
  
end
