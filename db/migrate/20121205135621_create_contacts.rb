class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :contact_person
      t.string :organisation
      t.string :address1
      t.string :address2
      t.string :city
      t.string :county
      t.string :postcode
      t.string :country
      t.string :phone
      t.string :website
      t.string :email
      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
