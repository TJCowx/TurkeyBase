class OrderSeasonPickupDate < ApplicationRecord
    belongs_to :order_season, optional: true
    has_one :order_season, foreign_key: "order_season_id"
    validates :pickup_date, presence: true
end
