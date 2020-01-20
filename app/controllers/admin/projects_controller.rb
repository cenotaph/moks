class Admin::ProjectsController < Admin::BaseController
  prepend_before_action :find_project, :only => [:show, :edit, :update, :destroy]

   def create
    create! { admin_projects_path }
  end

  def update
    update! { admin_projects_path }
  end

  def destroy
    destroy! { admin_projects_path }
  end

  private

  def find_project
    @project = Project.friendly.find(params[:id])
  end

  protected

  def resource_params
    params.require(:project).permit(:website1, :website2, :projecttype_id, 
      :avatar, :proposable, :published, :slug, :active ,
      translations_attributes: [:id, :locale, :name, :description]
    )
  end

end
