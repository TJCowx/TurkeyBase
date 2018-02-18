# Order season table. Contains the dates that are going to be required to be ordered
# off of
class OrderSeason < ActiveRecord::Migration[5.1]
  def change
      create_table :order_seasons, {:id => false} do |t|
          t.integer :order_season_id, primary_key: true
          t.string :order_season_name
          t.boolean :current_season
      end

      execute <<-SQL
        CREATE SEQUENCE custom_order_season_id_seq START 1;
        ALTER SEQUENCE custom_order_season_id_seq OWNED BY order_seasons.order_season_id;
        ALTER TABLE order_seasons ALTER COLUMN order_season_id SET DEFAULT nextval('custom_order_season_id_seq');
      SQL

  end
end
