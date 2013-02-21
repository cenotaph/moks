class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :website1
      t.string :website2
      t.references :projectype
      t.string :avatar
      t.boolean :proposable
      t.boolean :published
      t.string :slug
      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
