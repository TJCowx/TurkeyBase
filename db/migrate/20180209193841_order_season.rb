# Order season table. Contains the dates that are going to be required to be ordered
# off of
class OrderSeason < ActiveRecord::Migration[5.1]
  def change
      create_table :order_seasons, {:id => false} do |t|
          t.integer :order_season_id, primary_key: true
          t.string :order_season_name
          t.boolean :current_season
      end
  end
end
