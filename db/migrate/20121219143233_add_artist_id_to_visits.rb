class AddArtistIdToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :artist_id, :integer
  end
end
