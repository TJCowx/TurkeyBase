class AddOrderSeasonToOrders < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :order_season, index: true
  end
end
