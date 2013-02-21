class CreateArtists < ActiveRecord::Migration
  def self.up
    create_table :artists do |t|
      t.string :name
      t.string :website1
      t.string :website2
      t.string :website3
      t.string :avatar
      t.string :country
      t.string :slug
      t.timestamps
    end
  end

  def self.down
    drop_table :artists
  end
end
