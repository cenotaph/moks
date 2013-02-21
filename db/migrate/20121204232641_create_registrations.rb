class CreateRegistrations < ActiveRecord::Migration
  def self.up
    create_table :registrations do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.float :amount_paid
      t.text :comments
      t.string :optional_answer
      t.references :event
      t.boolean :actually_showed_up
      t.boolean :waiting_list
      t.timestamps
    end
  end

  def self.down
    drop_table :registrations
  end
end
