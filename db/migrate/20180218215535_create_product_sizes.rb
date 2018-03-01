class CreateProductSizes < ActiveRecord::Migration[5.1]
  def change
    create_table :product_sizes, {:id => false} do |t|
        t.belongs_to :product, index: true
        t.integer :product_size_id, primary_key: true
        t.string :product_size_name
        t.boolean :active_size
    end

    execute <<-SQL
        CREATE SEQUENCE custom_product_size_id_seq START 1;
        ALTER SEQUENCE custom_product_size_id_seq OWNED BY product_sizes.product_size_id;
        ALTER TABLE product_sizes ALTER COLUMN product_size_id SET DEFAULT nextval('custom_product_size_id_seq')
    SQL
  end
end
