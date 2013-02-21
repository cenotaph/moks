class AddFieldsToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :receipt_number, :string
    add_column :expenses, :date_on_bill, :date
    remove_column :expenses, :paid_by
    add_column :users, :artist_id, :integer

  end
end
