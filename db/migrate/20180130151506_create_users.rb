# Create the users table with the user_id and the admin check
class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
        t.string :user_id
        t.boolean :is_admin
    end
  end
end
