class CreateDocumenttypes < ActiveRecord::Migration
  def self.up
    create_table :documenttypes do |t|
      t.string :name
      t.timestamps
    end
    add_column :documents, :attachable_type, :string
    add_column :documents, :attachable_id, :integer
  end

  def self.down
    drop_table :documenttypes
  end
end
