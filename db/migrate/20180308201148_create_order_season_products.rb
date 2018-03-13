class CreateOrderSeasonProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :order_season_products do |t|
        t.references :order_seasons, index: true
        t.references :products, index: true
    end
  end
end
