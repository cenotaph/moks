class AddDimensionsToImages < ActiveRecord::Migration
  def change
    add_column :images, :content_type, :string
    add_column :images, :size, :integer, :limit => 8
    add_column :images, :height, :integer
    add_column :images, :width, :integer
  end
end
