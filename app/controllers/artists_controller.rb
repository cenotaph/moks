class ArtistsController < InheritedResources::Base

  def index
    @artists = Visit.where(["start_date <= ? and end_date >= ?", Time.now.to_date, Time.now.to_date]).map(&:artist)
  end
  
  def past
    @visits = Visit.includes(:artist).order('visits.start_date DESC')
  end

end