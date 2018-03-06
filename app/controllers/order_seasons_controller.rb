class OrderSeasonsController < ApplicationController
    skip_before_action :require_admin, only: :list_orders
    # Renders a list of products
    def index
        # Get all the order seasons, active season first, then sort alphibetically
        @order_seasons = OrderSeason.all.order(current_season: :desc).order(:order_season_name)
    end

    # For rendering the edit order season page
    def edit
        @order_season = OrderSeason.find(params[:id])           # Get the order season selected
        @pickup_dates = PickupDate.where(:order_season_id => @order_season.order_season_id)  # Get the pickup dates in the order season
        @pickup_date = PickupDate.new   # For adding a new pickup date
    end

    # Deleting the order season
    def destroy
        # Get the user to be deleted
        OrderSeason.find(params[:id]).destroy
        flash[:success]= "Order season deleted"
        redirect_to order_seasons_url # Redirect the user back to the same page with a success message
    end

    # Update the order season
    def update
        @order_season = OrderSeason.find(params[:id])   # Get the order season
        @pickup_dates = PickupDate.where(:order_season_id => @order_season.order_season_id)  # Get the pickup dates in the order season
        @pickup_date = PickupDate.new   # For adding a new pickup date

        # Updates the order season if values are correct
        # Returns errors if the values are incorrect
        if @order_season.update_attributes(order_season_params)
            # If current season was checked, unset any other active seasons
            if @order_season.current_season?
                set_active_order_season
            end

            # Redirect to index with success message
            flash[:success] = "#{@order_season.order_season_name} has been updated!"
            redirect_to order_seasons_url
        else
            render 'edit'
        end
    end

    # For rendering a new page
    def new
        # Starts creating a new order season & pickup date
        @order_season = OrderSeason.new
        @date = PickupDate.new
        # Get the pickup dates tied to the order season
        @pickup_date = @order_season.pickup_date.build
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
                @date = PickupDate.new(:order_season_id => season_id, :pickup_date => date)
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
            redirect_to order_seasons_url

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

    # List the orders in the selected order season
    def list_orders
        # Get all the order seasons
        @order_seasons = OrderSeason.all
        # Get the current selected season
        @order_season = OrderSeason.find(params[:id])
        # Get all the orders in the current selected season
        @orders = Order.where(:order_season_id => params[:id])
        # Get all the products
        @product_orders = Product.all
    end


    protected
        # Get the order season params, with the pickup_date params
        def order_season_params
            params.require(:order_season).permit(:order_season_id, :order_season_name,
                :current_season, :pickup_date_start, :pickup_date_end,
                pickup_dates_attributes: [:pickup_date_id, :pickup_date ])
        end

end
