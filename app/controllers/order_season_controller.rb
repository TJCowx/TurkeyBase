class OrderSeasonController < ApplicationController
    def index
    end

    def new
        # Starts creating a new order season
        @order_season = OrderSeason.new
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

            # Loop through each date in the range supplued
            # and store it into the database
            @order_season.pickup_date_start.upto(@order_season.pickup_date_end) { |date|
                @order_season_pickup_date.new = OrderSeasonPickupDate(pickup_date: date,
                    order_season_id: @order_season.order_season_id)
                @order_season_pickup_date.save!
            }

            # Set the messate and redirect to the seasons index
            flash[:success] = "How did this get through?"
            redirect_to order_season_url
        else
            render 'new'
        end
    end

    protected
        # Get the order season params, with the pickup_date params
        def order_season_params
            params.require(:order_season).permit(:order_season_id, :order_season_name,
                :current_season, :pickup_date_start, :pickup_date_end, order_season_pickup_dates_attributes: [:pickup_date_id, :pickup_date ])
        end

end
