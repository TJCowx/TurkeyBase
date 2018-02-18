class CreateProductStyles < ActiveRecord::Migration[5.1]
  def change
    create_table :product_styles, {:id => false} do |t|
        t.belongs_to :product, index: true
        t.integer :product_style_id, primary_key: true
        t.string :product_style_name
        t.boolean :active_style
    end

    execute <<-SQL
        CREATE SEQUENCE custom_product_style_id_seq START 1;
        ALTER SEQUENCE custom_product_style_id_seq OWNED BY product_styles.product_style_id;
        ALTER TABLE product_styles ALTER COLUMN product_style_id SET DEFAULT nextval('custom_product_style_id_seq')
    SQL

  end
end
