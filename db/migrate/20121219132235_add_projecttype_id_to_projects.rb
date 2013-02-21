class AddProjecttypeIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :projecttype_id, :integer
    remove_column :projects, :projectype_id
  end
end
