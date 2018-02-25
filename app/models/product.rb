class Product < ApplicationRecord
    has_many :product_sizes
    has_many :product_styles
    # For the size & style sub-forms
    accepts_nested_attributes_for :product_sizes
    accepts_nested_attributes_for :product_styles
    # Custom Fields
    attr_accessor :size, :style, :select_size, :select_style

    # Product name must be unique and be between 3-20 characters in length
    validates :product_name, presence: true, length: {maximum: 20, minimum:3},
        uniqueness: {case_sensitive: false}
    validate :validate_size_style
    validates :size, presence: true, on: :create
    #validates :style, presence: true, on: :create
    validates :size, length: {minimum: 3, maximum: 20}
    #validates :style, length: {minimum: 3, maximum: 20}

    private
    def validate_size_style
        return errors.add :base, "Must have at least one Style" unless :style.length > 0
        return errors.add :base, "Must have at least one Size" unless :size.length > 0
    end

end
