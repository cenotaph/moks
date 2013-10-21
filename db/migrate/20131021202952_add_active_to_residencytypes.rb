class AddActiveToResidencytypes < ActiveRecord::Migration
  def change
    add_column :residencytypes, :active, :boolean, :default => true, :null => false
  end
end
