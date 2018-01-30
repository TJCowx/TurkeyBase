# Creates the index to the users.
# Index is the user_id and is unique
class AddIndexUsersUserid < ActiveRecord::Migration[5.1]
  def change
      add_index :users, :user_id, unique: true
  end
end
