class Admin::FundersController < Admin::BaseController
  prepend_before_filter :find_funder, :only => [:show, :edit, :update, :destroy]
  def create
    create! { admin_funders_path }
  end

  def update
    update! { admin_funders_path }
  end

  def destroy
    destroy! { admin_funders_path }
  end
  
  private

  def find_funder
    @funder = Funder.friendly.find(params[:id])
  end

  protected

  def permitted_params
    params.permit(:funder => [ :name, :published, :logo,  :artist, :remove_logo,
                                translations_attributes: [ :description, :id, :locale]
                                ])
  end

end
