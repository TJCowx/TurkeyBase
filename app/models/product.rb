class Product < ApplicationRecord
    has_many :product_sizes
    has_many :product_styles
    # For the size & style sub-forms
    accepts_nested_attributes_for :product_sizes
    accepts_nested_attributes_for :product_styles

    # Product name must be unique and be between 3-20 characters in length
    validates :product_name, presence: true, length: {maximum: 20, minimum:3},
        uniqueness: {case_sensitive: false}
    validate :validate_size_style

    private
    def validate_size_style
        return errors.add :base, "Must have at least one Style" unless :product_style_name.length > 6
        return errors.add :base, "Must have at least one Size" unless :product_size_name.length > 0
    end

end
