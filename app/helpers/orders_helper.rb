module OrdersHelper
    def current_season
        @current_season ||= OrderSeason.find_by(current_season: true)
    end
end
