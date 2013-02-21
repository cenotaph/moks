class CreateVideohosts < ActiveRecord::Migration
  def change
    create_table :videohosts do |t|
      t.string :name

      t.timestamps
    end
  end
end
