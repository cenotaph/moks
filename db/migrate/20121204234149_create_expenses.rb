class CreateExpenses < ActiveRecord::Migration
  def self.up
    create_table :expenses do |t|
      t.date :date_paid
      t.string :recipient
      t.string :what_for
      t.references :event
      t.float :amount
      t.boolean :hidden
      t.string :paid_by
      t.references :budgetarea
      t.boolean :has_receipt
      t.timestamps
    end
  end

  def self.down
    drop_table :expenses
  end
end
