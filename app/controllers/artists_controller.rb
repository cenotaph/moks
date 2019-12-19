class ArtistsController < InheritedResources::Base
  prepend_before_action :find_artist, :only => :show
  def index
    @artists = Visit.where(["start_date <= ? and end_date >= ?", Time.now.to_date, Time.now.to_date]).map(&:artist)
  end
  
  def past
    @visits = Visit.includes(:artist).order('visits.start_date DESC')
  end

  private

  def find_artist
    @artist = Artist.friendly.find(params[:id])
  end

end