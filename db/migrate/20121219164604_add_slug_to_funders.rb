class AddSlugToFunders < ActiveRecord::Migration
  def change
    add_column :funders, :slug, :string
    remove_column :funders, :visit_id
    remove_column :funders, :artist_id
  end
end
