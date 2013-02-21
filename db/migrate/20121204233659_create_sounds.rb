class CreateSounds < ActiveRecord::Migration
  def self.up
    create_table :sounds do |t|
      t.string :soundcloud_id
      t.string :filename
      t.references :event
      t.boolean :published
      t.timestamps
    end
  end

  def self.down
    drop_table :sounds
  end
end
