class OrderSeasonController < ApplicationController
    def index
        # Get all the order seasons, active season first, then sort alphibetically
        @order_seasons = OrderSeason.all.order(current_season: :desc).order(:order_season_name)
    end

    def edit
        @order_season = OrderSeason.find(params[:id])           # Get the order season selected
        @pickup_dates = OrderSeasonPickupDate.where(:order_season_id => @order_season.order_season_id)  # Get the pickup dates in the order season
        @order_season_pickup_date = OrderSeasonPickupDate.new   # For adding a new pickup date
    end

    def new
        # Starts creating a new order season
        @order_season = OrderSeason.new
        @date = OrderSeasonPickupDate.new
        # Get the pickup dates tied to the order season
        @order_season_pickup_date = @order_season.order_season_pickup_date.build
    end

    # Creates the order season & the date in the season
    def create
        # Stores all the parameters entered in for the order season
        @order_season = OrderSeason.new(order_season_params)

        # If user is saved, redirect to order season index page
        # with a message, if there is errors, redirect them back
        # to the same view with the errors listed
        if @order_season.save
            season_id = @order_season.order_season_id

            # Create the array for date range
            date_range = Array.new
            # Put the date range values in from start and end date
            date_range = (Date.parse(@order_season.pickup_date_start)..Date.parse(@order_season.pickup_date_end)).to_a

            # Loop through each date and add it to the database
            date_range.each do |date|
                @date = OrderSeasonPickupDate.new(:order_season_id => season_id, :pickup_date => date)
                @date.save
            end

            # If current season was checked, unset any other active seasons
            if @order_season.current_season?
                set_active_order_season

            end

            # Send message to the user and redirect to the
            # season listing
            flash[:success] = "Order Season: #{@order_season.order_season_name}
                has been added!"
            redirect_to order_season_url

        else
            render 'new'
        end
    end

    # Set the active order season
    def set_active_order_season
        # Set any active ordering season to false
        OrderSeason.where(:current_season => true).where.not(:order_season_id => @order_season.order_season_id).update_all(:current_season => false)
        # Set the current season

    end


    protected
        # Get the order season params, with the pickup_date params
        def order_season_params
            params.require(:order_season).permit(:order_season_id, :order_season_name,
                :current_season, :pickup_date_start, :pickup_date_end,
                order_season_pickup_dates_attributes: [:pickup_date_id, :pickup_date ])
        end

end
