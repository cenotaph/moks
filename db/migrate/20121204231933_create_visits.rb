class CreateVisits < ActiveRecord::Migration
  def self.up
    create_table :visits do |t|
      t.date :start_date
      t.date :end_date
      t.boolean :is_rental
      t.references :project
      t.references :residencytype
      t.boolean :published
      t.timestamps
    end
  end

  def self.down
    drop_table :visits
  end
end
