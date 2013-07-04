class Admin::PostcategoriesController < Admin::BaseController

  def create
    create! { admin_postcategories_path }
  end

  def update
    update! { admin_postcategories_path }
  end

  def destroy
    destroy! { admin_postcategories_path }
  end

  protected

  def permitted_params
    params.permit(:postcategory => [ translations_attributes: [:id, :locale, :name]])
  end
end
