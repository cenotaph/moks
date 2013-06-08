class CreateAdminStaffcomments < ActiveRecord::Migration
  def change
    create_table :admin_staffcomments do |t|

      t.timestamps
    end
  end
end
