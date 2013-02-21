class CreateEventsProjects < ActiveRecord::Migration
  def up
    create_table :events_projects do |t|
      t.integer :event_id
      t.integer :project_id
    end
    create_table :funders_visits do |t|
      t.integer :funder_id
      t.integer :visit_id
    end    
    create_table :events_visits do |t|
      t.integer :event_id
      t.integer :visit_id
    end
    add_index :events_projects, [:event_id, :project_id]
    add_index :events_visits, [:event_id, :visit_id]
    add_index :funders_visits, [:funder_id, :visit_id]

  end

  def down
    drop_table :events_projects
    drop_table :events_visits

  end
end
