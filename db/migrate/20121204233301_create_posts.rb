class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.references :user
      t.boolean :is_personal
      t.boolean :sticky
      t.references :event
      t.boolean :published
      t.string :slug
      t.integer :postcategory_id
      t.datetime :posted_at
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
