class CreateFunders < ActiveRecord::Migration
  def self.up
    create_table :funders do |t|
      t.string :name
      t.boolean :published
      t.string :logo
      t.references :visit
      t.references :artist
      t.timestamps
    end

  end

  def self.down
    drop_table :funders

  end
end
