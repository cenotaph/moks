class CreateProjectproposals < ActiveRecord::Migration
  def self.up
    create_table :projectproposals do |t|
      t.string :name
      t.string :organisation
      t.string :email
      t.string :address
      t.string :country_of_origin
      t.string :country_of_residence
      t.string :phone_number
      t.text :short_description
      t.string :duration
      t.text :long_description
      t.text :public_engagement
      t.text :materials
      t.text :spatial_requirements
      t.text :cost
      t.text :bio
      t.text :urls
      t.text :moks_goodfit
      t.string :attachment
      t.boolean :archived
      t.integer :project_id
      t.timestamps
    end
  end

  def self.down
    drop_table :projectproposals
  end
end
