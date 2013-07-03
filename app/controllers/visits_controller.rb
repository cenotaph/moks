class VisitsController < ApplicationController

  def show
    visit = Visit.find(params[:id])
    redirect_to artist_path(visit.artist)
  end
end
