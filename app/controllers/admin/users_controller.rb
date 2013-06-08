class Admin::UsersController < Admin::BaseController

  def destroy
    destroy! { admin_users_path }
  end
  
  def edit_profile
    @user = current_user
    render :template => 'admin/users/edit'
  end
end

