class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.integer :attachable_id
      t.string :attachable_type
      t.string :filename
      t.string :credit
      t.boolean :published
      t.timestamps
    end
  end

  def self.down
    drop_table :images
  end
end
