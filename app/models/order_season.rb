class OrderSeason < ApplicationRecord
    has_many :pickup_date
    has_many :orders, :through => :pickup_dates
    attr_accessor :pickup_date_start, :pickup_date_end
    accepts_nested_attributes_for :pickup_date
    validates :order_season_name, presence: true, length: {minimum: 5, maximum: 50}
    validates :pickup_date_end, presence: true, on: :create
    validates :pickup_date_start, presence: true, on: :create
    validate :end_date_after_start_date, on: :create


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
