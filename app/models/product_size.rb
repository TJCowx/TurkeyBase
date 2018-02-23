class ProductSize < ApplicationRecord
    belongs_to :product, foreign_key: 'product_id', optional: true
    validates :product_size_name, presence: true
end
