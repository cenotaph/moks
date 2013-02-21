
class CreateTranslationTableEventsvisits < ActiveRecord::Migration
  def up
    create_table :events_visit_translations do |t|
      t.string :locale
      t.integer :events_visit_id
      t.text :description
      t.timestamps
    end
  end

  def down
    drop_table :events_visit_translations
  end
end
