class Admin::UsersController < Admin::BaseController

  def destroy
    destroy! { admin_users_path }
  end
  
end

