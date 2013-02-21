class CreateIncomes < ActiveRecord::Migration
  def self.up
    create_table :incomes do |t|
      t.date :date_received
      t.string :recipient
      t.string :what_for
      t.references :event
      t.references :funder
      t.references :project
      t.float :amount
      t.boolean :hidden
      t.string :source
      t.references :budgetarea
      t.boolean :has_receipt
      t.references :invoice
      t.timestamps
    end
  end

  def self.down
    drop_table :incomes
  end
end
