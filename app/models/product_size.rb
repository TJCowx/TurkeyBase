class ProductSize < ApplicationRecord
    belongs_to :product, foreign_key: 'product_id'
    validates :product_size_name, presence: true, length: {maximum: 20, minimum:2}, on: :create

    def toggle_active!
        update active_size: !active_size 
    end
end
