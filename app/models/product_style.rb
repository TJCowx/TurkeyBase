class ProductStyle < ApplicationRecord
    belongs_to :product, foreign_key: 'product_id', optional: true
    validates :product_style_name, presence: true
end
