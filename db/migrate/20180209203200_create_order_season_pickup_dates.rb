# Order Seasons pickup dates table belongs to the order season table
class CreateOrderSeasonPickupDates < ActiveRecord::Migration[5.1]
  def change
    create_table :pickup_dates, {:id => false} do |t|
        t.belongs_to :order_season, index: true
        t.integer :pickup_date_id, primary_key: true
        t.date :pickup_date
    end

    execute <<-SQL
        CREATE SEQUENCE custom_pickup_id_seq START 1;
        ALTER SEQUENCE custom_pickup_id_seq OWNED BY pickup_dates.pickup_date_id;
        ALTER TABLE pickup_dates ALTER COLUMN pickup_date_id SET DEFAULT nextval('custom_pickup_id_seq');
    SQL
  end
end
