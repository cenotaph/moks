class CreateDocuments < ActiveRecord::Migration
  def self.up
    create_table :documents do |t|
      t.string :name
      t.integer :user_id
      t.text :description
      t.string :attachment
      t.boolean :public
      t.integer :documenttype_id
      t.timestamps
    end
  end

  def self.down
    drop_table :documents
  end
end
