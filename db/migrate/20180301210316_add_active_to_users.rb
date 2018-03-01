class AddActiveToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :active_user, :boolean
  end
end
