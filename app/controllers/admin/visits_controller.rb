class Admin::VisitsController < Admin::BaseController

  def new
    if params[:artist_id]
      @visit = Visit.new(:artist_id => Artist.find(params[:artist_id]).id)

    else
      @visit = Visit.new
    end
  end

   def create
    create! { admin_artist_path(@visit.artist) }
  end

  def update
    update! { admin_artist_path(@visit.artist) }
  end

  def destroy
    destroy! { admin_artist_path(@visit.artist) }
  end

end
