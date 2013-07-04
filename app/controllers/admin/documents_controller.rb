class Admin::DocumentsController < Admin::BaseController
  
  def create
    create! { admin_documents_path }
  end


  def update
    update! { admin_documents_path }
  end

  def destroy
    destroy! { admin_documents_path }
  end
  
  protected

  def permitted_params
    params.permit(:document => [:attachable_id, :attachable_type, :name, :user_id, :description, 
                                :attachment, :public, :documenttype_id])
  end

end
