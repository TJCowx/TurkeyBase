class AddLoginRoleToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :login_role, :boolean
  end
end
