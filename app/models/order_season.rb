class OrderSeason < ApplicationRecord
    has_many :order_season_pickup_date
    attr_accessor :pickup_date_start, :pickup_date_end
    accepts_nested_attributes_for :order_season_pickup_date
    validates :order_season_name, presence: true, length: {minimum: 5, maximum: 50}
    validates :pickup_date_end, presence: true
    validates :pickup_date_start, presence: true
    validate :end_date_after_start_date


    private
    # Check to see if the end date is on the
    # same date or after the start date
    def end_date_after_start_date
        # If there is no field output
        return if pickup_date_start.blank? || pickup_date_end.blank?

        # Check if the end date if before the start date
        if pickup_date_end < pickup_date_start
            errors.add(:pickup_date_end, " must not be before the start date")
        end
    end

end
