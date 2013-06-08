class CreateStaffcomments < ActiveRecord::Migration
  def change
    create_table :staffcomments do |t|
      t.string :commentable_type
      t.integer :commentable_id
      t.references :user
      t.text :comment

      t.timestamps
    end
    add_index :staffcomments, :user_id
  end
end
