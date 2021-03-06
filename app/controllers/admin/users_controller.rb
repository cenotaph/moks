class Admin::UsersController < Admin::BaseController

  def destroy
    destroy! { admin_users_path }
  end
  
  def edit_profile
    @user = current_user
    render :template => 'admin/users/edit'
  end

  protected

  def permitted_params
    params.permit(:user => [ :name, :artist_id, :role_ids, :real_name, :avatar, :username, :email, :password, :password_confirmation, :remember_me, role_ids: [] 
      ])
  end

end

