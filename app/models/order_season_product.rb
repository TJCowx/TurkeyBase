class OrderSeasonProduct < ApplicationRecord
    has_one :order_season
    has_one :product

    validates :products_id, presence: true
    validates :order_seasons_id, presence: true
end
