class Admin::StaffcommentsController < InheritedResources::Base

  def create
    create! { [:admin, @staffcomment.commentable] }
  end


end
