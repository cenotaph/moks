class RolifyCreateRoles < ActiveRecord::Migration
  def change
    create_table(:roles) do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps
    end
    execute('insert into roles (name) values ("Goddess")')
    execute('insert into roles (name) values ("Member")')
    execute('insert into roles (name) values ("Visitor")')
    execute('insert into roles (name) values ("Nothing")')
    create_table(:users_roles, :id => false) do |t|
      t.references :user
      t.references :role
    end
    execute('insert into users_roles (user_id, role_id) values (1, 1)')
    execute('insert into users_roles (user_id, role_id) values (1, 2)')
    execute('insert into users_roles (user_id, role_id) values (1, 3)')

    add_index(:roles, :name)
    add_index(:roles, [ :name, :resource_type, :resource_id ])
    add_index(:users_roles, [ :user_id, :role_id ])
  end
end
