class PopulateVideohosts < ActiveRecord::Migration
  def up
    Videohost.create(:name => 'Vimeo')
    Videohost.create(:name => 'YouTube')
  end

  def down
    Videohost.delete_all(:name => 'Vimeo')
    Videohost.delete_all(:name => 'YouTube')
  end
end
