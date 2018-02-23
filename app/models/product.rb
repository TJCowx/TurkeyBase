class Product < ApplicationRecord
    has_many :product_sizes, :dependent => :destroy
    has_many :product_styles, :dependent => :destroy
    attr_accessor :product_styles_attributes, :product_sizes_attributes
    # For the size & style sub-forms
    accepts_nested_attributes_for :product_sizes, allow_destroy: true
    accepts_nested_attributes_for :product_styles, allow_destroy: true

    # Product name must be unique and be between 3-20 characters in length
    validates :product_name, presence: true, length: {maximum: 20, minimum:3},
        uniqueness: {case_sensitive: false}

    private

    def rejectable_size(attributes)
        attributes['product_style_name'].blank? && !new_record?
    end

    def rejectable_style(attributes)

    end

end
