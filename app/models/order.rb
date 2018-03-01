class Order < ApplicationRecord
    # Associations
    has_one :product
    has_one :product_style
    has_one :product_size
    has_one :user
    has_one :pickup_date
    has_one :order_season, :through => :order_season_pickup_date

    # Validation
    validates :cust_fname, presence: true
    validates :cust_lname, presence: true
    validates :cust_phone, presence: true, length: {is: 10},
        format: { with: /\A\d+\z/, message: "The phone number must only have numbers."}
    validates :products_id, presence: true
    validates :product_styles_id, presence: true
    validates :product_sizes_id, presence: true
    validates :order_requests, length: {maximum: 255}
    validates :user, presence: true

end
