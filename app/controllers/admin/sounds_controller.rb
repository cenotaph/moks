class Admin::SoundsController < Admin::BaseController

  def index
    @sound = Sound.filter(:params => params, :filter => :sound_filter)
  end
  
  def create
    create! { admin_sounds_path }
  end

  def update
    update! { admin_sounds_path }
  end

  def destroy
    destroy! { admin_sounds_path }
  end

end
