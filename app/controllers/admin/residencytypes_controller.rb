class Admin::ResidencytypesController < Admin::BaseController

 
  def create
    create! { admin_residencytypes_path }
  end

  def update
    update! { admin_residencytypes_path }
  end

  def destroy
    destroy! { admin_residencytypes_path }
  end

  protected

  def permitted_params
    params.permit(:residencytype => [:active, translations_attributes: [:id, :locale, :name]])
  end
end
