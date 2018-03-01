class PickupDatesController < ApplicationController

    # Adds the pickup date into the table
    def create
        @pickup_date = PickupDate.new(pickup_date_params)

        # Check to see if the date already exists
        if PickupDate.exists?(:pickup_date => @pickup_date.pickup_date,
            :order_season_id => @pickup_date.order_season_id)
            # If it exists, show user and redirect back
            flash[:danger] = "Pickup date already exists in this season"
            redirect_back fallback_location: '/order_season'
        else
            # If date doesn't Save the date
            if @pickup_date.save
                # Show user success message then redirect back
                flash[:success] = "#{@pickup_date.pickup_date} was
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
        PickupDate.find(params[:id]).destroy     # Deletes the pickup date
        # Show user success message, redirect back
        flash[:success] = "Pickup date successfully deleted!"
        redirect_back fallback_location: '/order_season'
    end

    protected
        def pickup_date_params
            params.require(:pickup_date).permit(:order_season_id, :pickup_date,
                :pickup_date_id)
        end

end
