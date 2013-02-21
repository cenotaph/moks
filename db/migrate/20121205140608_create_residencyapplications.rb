class CreateResidencyapplications < ActiveRecord::Migration
  def self.up
    create_table :residencyapplications do |t|
      t.string :name
      t.string :organisation
      t.string :email
      t.string :address1
      t.string :address2
      t.string :city
      t.string :county
      t.string :postcode
      t.string :country_of_residence
      t.string :country_of_origin
      t.integer :gender
      t.string :contact_phone
      t.string :field_of_interest
      t.text :urls
      t.string :languages_spoken
      t.string :cv
      t.string :other_attachment
      t.string :preferred_dates
      t.text :funny_question
      t.text :other_questions
      t.text :how_did_hear
      t.string :reason, :limit => 2000
      t.integer :residencytype_id
      t.timestamps
    end
  end

  def self.down
    drop_table :residencyapplications
  end
end
