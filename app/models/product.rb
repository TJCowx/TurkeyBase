class Product < ApplicationRecord
    # Product name must be unique and be between 3-20 characters in length
    validates :product_name, presence: true, length: {maximum: 20, minimum:3},
        uniqueness: {case_sensitive: false}

end
