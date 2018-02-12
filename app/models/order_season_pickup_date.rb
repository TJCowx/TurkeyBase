class OrderSeasonPickupDate < ApplicationRecord
    belongs_to :order_season
    has_one :order_season
    
end
