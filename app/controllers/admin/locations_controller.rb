class Admin::LocationsController < Admin::BaseController
  def create
    create! { admin_locations_path }
  end

  def update
    update! { admin_locations_path }
  end

  def destroy
    destroy! { admin_locations_path }
  end
end
