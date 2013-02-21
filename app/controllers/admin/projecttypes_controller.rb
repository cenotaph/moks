class Admin::ProjecttypesController < Admin::BaseController
   def create
    create! { admin_projecttypes_path }
  end

  def update
    update! { admin_projecttypes_path }
  end

  def destroy
    destroy! { admin_projecttypes_path }
  end
end
