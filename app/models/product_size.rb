class ProductSize < ApplicationRecord
    belongs_to :product, foreign_key: 'product_id'
    validates :product_size_name, presence: true, length: {maximum: 20, minimum:2}, on: :create
    def toggle_active!
        update active_size: !active_size
    end

    # def self.for_select(season_product)
    #     season_product.map do |product|
    #         [product, ProductSize.where(:product_id => product.product_id, :active_size=>true){|s| [s.product_size_id, s.product_size_name]}]
    #     end
    # end
end
