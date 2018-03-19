class PickupDate < ApplicationRecord
    belongs_to :order_season, optional: true
    has_one :order_season, foreign_key: "order_season_id"
    has_many :orders
    validates :pickup_date, presence: true
end
