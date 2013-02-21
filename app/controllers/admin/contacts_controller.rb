class Admin::ContactsController < Admin::BaseController

  def index
    @contact = Contact.filter(:params => params, :filter => :contact_filter)
  end
  
  def create
    create! { admin_contacts_path }
  end

  def update
    update! { admin_contacts_path }
  end

  def destroy
    destroy! { admin_contacts_path }
  end
end
