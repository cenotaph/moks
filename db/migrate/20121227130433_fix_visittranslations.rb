class FixVisittranslations < ActiveRecord::Migration
  def up
    change_column :visit_translations, :description, :text
  end

  def down
  end
end
