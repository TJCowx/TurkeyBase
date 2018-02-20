class Product < ApplicationRecord
    has_many :product_sizes, :product_styles
    accepts_nested_attributes       # For the size & style sub-forms
    # Product name must be unique and be between 3-20 characters in length
    validates :product_name, presence: true, length: {maximum: 20, minimum:3},
        uniqueness: {case_sensitive: false}
end
