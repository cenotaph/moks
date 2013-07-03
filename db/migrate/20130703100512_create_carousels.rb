class CreateCarousels < ActiveRecord::Migration
  def change
    create_table :carousels do |t|
      t.boolean :active, :default => false, :null => false
      t.string :alternate_url
      t.string :item_type
      t.integer :item_id
      t.decimal :sort_order, :null => false, :default => 0
      t.string :carousel_image
      t.timestamps
    end
  end
end
