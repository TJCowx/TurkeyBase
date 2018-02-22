class ProductSize < ApplicationRecord
    belongs_to :product, foreign_key: 'product_id'
    validates :product_size_name, presence: true, length: {maximum: 20, minimum:2}, on: :create
end
