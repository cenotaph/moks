class AddOldbylineToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :old_byline, :string

  end
end
