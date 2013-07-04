class Admin::PublicitiesController < Admin::BaseController
   def create
    create! { admin_publicities_path }
  end

  def update
    update! { admin_publicities_path }
  end

  def destroy
    destroy! { admin_publicities_path }
  end

  protected

  def permitted_params
    params.permit(:publicity => [ :name, :source, :author, :attachment, :url, :project_id, 
                                  :event_id, :visit_id, :sortorder,
                                  translations_attributes: [:id, :locale, :description]
                                ])
  end
end
