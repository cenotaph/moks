class Admin::ContactsController < Admin::BaseController

 
  def create
    create! { admin_contacts_path }
  end

  def update
    update! { admin_contacts_path }
  end

  def destroy
    destroy! { admin_contacts_path }
  end

  protected

  def permitted_params
    params.permit(:contact => [:contact_person, :organisation, :address1, :address2, :city, :county, 
                                :postcode, :country, :phone, :website, :email])
  end

end
