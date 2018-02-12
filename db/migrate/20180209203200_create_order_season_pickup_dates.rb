# Order Seasons pickup dates table belongs to the order season table
class CreateOrderSeasonPickupDates < ActiveRecord::Migration[5.1]
  def change
    create_table :order_season_pickup_dates, {:id => false} do |t|
        t.belongs_to :order_season, index: true
        t.integer :pickup_date_id, primary_key: true
        t.date :pickup_date
    end
  end
end
