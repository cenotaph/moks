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
end
