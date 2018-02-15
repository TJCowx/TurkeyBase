class OrderSeasonPickupDatesController < ApplicationController

    # Adds the pickup date into the table
    def create
        @order_season_pickup_date = OrderSeasonPickupDate.new(pickup_date_params)

        # Check to see if the date already exists
        if OrderSeasonPickupDate.exists?(:pickup_date => @order_season_pickup_date.pickup_date,
            :order_season_id => @order_season_pickup_date.order_season_id)
            # If it exists, show user and redirect back
            flash[:danger] = "Pickup date already exists in this season"
            redirect_back fallback_location: '/order_season'
        else
            # If date doesn't Save the date
            if @order_season_pickup_date.save
                # Show user success message then redirect back
                flash[:success] = "#{@order_season_pickup_date.pickup_date} was
                    successfully added!"
                redirect_back fallback_location: '/order_season'
            else
                # Show user error message and redirect back
                flash[:danger] = "Invalid pickup date"
                redirect_back fallback_location: '/order_season'
            end
        end
    end

    # Delete the pickup date from the table
    def destroy
        OrderSeasonPickupDate.find(params[:id]).destroy     # Deletes the pickup date
        # Show user success message, redirect back
        flash[:success] = "Pickup date successfully deleted!"
        redirect_back fallback_location: '/order_season'
    end

    protected
        def pickup_date_params
            params.require(:order_season_pickup_date).permit(:order_season_id, :pickup_date,
                :pickup_date_id)
        end

end
