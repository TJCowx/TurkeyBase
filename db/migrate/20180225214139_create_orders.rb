class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders, {:id => false} do |t|
        t.integer :order_id, primary_key: true
        t.string :cust_fname
        t.string :cust_lname
        t.string :cust_phone
        t.string :order_requests
        t.boolean :picked_up
        t.references :users, index: true
        t.references :order_season_pickup_dates, index: true
        t.references :products, index:true
        t.references :product_styles, index: true
        t.references :product_sizes, index: true
    end

    execute <<-SQL
        CREATE SEQUENCE custom_order_id_seq START 1;
        ALTER SEQUENCE custom_order_id_seq OWNED BY orders.order_id;
        ALTER TABLE orders ALTER COLUMN order_id SET DEFAULT nextval('custom_order_id_seq');
    SQL

  end
end
