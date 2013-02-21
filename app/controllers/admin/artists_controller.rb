class Admin::ArtistsController < Admin::BaseController
  def create
    create! { admin_artists_path }
  end

  def update
    update! { admin_artists_path }
  end

  def destroy
    destroy! { admin_artists_path }
  end
end
