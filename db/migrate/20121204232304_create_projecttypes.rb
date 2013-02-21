class CreateProjecttypes < ActiveRecord::Migration
  def self.up
    create_table :projecttypes do |t|
      t.boolean :is_major
      t.timestamps
    end
  end

  def self.down
    drop_table :projecttypes
  end
end
