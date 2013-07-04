class FixPostgresNulls < ActiveRecord::Migration
  def change
    change_column :invoices, :paid, :boolean, :null => false, :default => false
  end
end
