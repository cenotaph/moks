class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.string :promoter
      t.float :cost
      t.float :discounted_cost
      t.string :discount_reason
      t.boolean :register_through_project
      t.boolean :registration_required
      t.integer :registration_limit
      t.string :registration_recipient
      t.string :registration_optional_q
      t.boolean :hide_registrants
      t.string :avatar
      t.references :location
      t.boolean :donations_requested
      t.boolean :published
      t.string :slug
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
