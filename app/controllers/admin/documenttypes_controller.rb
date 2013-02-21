class Admin::DocumenttypesController < Admin::BaseController

  def create
    create! { admin_documenttypes_path }
  end

  def update
    update! { admin_documenttypes_path }
  end

  def destroy
    destroy! { admin_documenttypes_path }
  end

end