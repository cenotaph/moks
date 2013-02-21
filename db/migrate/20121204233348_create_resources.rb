class CreateResources < ActiveRecord::Migration
  def self.up
    create_table :resources do |t|
      t.references :event
      t.references :project
      t.string :attachment
      t.timestamps
    end
  end

  def self.down
    drop_table :resources
  end
end
