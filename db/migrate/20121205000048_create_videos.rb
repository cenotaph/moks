class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.references :videohost
      t.references :event
      t.string :provider_id_code
      t.boolean :published
      t.timestamps
    end
  end

  def self.down
    drop_table :videos
  end
end
