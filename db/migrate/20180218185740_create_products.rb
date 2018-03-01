class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products, {:id => false } do |t|
        t.integer :product_id, primary_key: true
        t.string :product_name
    end

    execute <<-SQL
        CREATE SEQUENCE custom_product_id_seq START 1;
        ALTER SEQUENCE custom_product_id_seq OWNED BY products.product_id;
        ALTER TABLE products ALTER COLUMN product_id SET DEFAULT nextval('custom_product_id_seq');
    SQL
  end
end
