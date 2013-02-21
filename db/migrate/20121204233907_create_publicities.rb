class CreatePublicities < ActiveRecord::Migration
  def self.up
    create_table :publicities do |t|
      t.string :name
      t.string :source
      t.string :author
      t.string :attachment
      t.string :url
      t.references :project
      t.references :event
      t.references :visit
      t.float :sortorder
      t.timestamps
    end
  end

  def self.down
    drop_table :publicities
  end
end
