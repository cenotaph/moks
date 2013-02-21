class Admin::ProjectsController < Admin::BaseController
   def create
    create! { admin_projects_path }
  end

  def update
    update! { admin_projects_path }
  end

  def destroy
    destroy! { admin_projects_path }
  end
end
