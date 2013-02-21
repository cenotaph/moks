class CreateInvoices < ActiveRecord::Migration
  def self.up
    create_table :invoices do |t|
      t.integer :contact_id
      t.date :date_issued
      t.date :date_due
      t.string :number
      t.float :amount
      t.string :attachment
      t.string :what_for
      t.timestamps
    end
  end

  def self.down
    drop_table :invoices
  end
end
