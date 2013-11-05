class Admin::StaffcommentsController < InheritedResources::Base

  def create
    create! { [:admin, @staffcomment.commentable] }
  end

  protected

  def permitted_params
    params.permit(:staffcomment => [:comment, :commentable_type, :commentable_id, :user_id])
  end

end
