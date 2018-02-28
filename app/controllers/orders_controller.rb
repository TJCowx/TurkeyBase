class OrdersController < ApplicationController
    # List of the orders in the current season
    def index

    end

    # Creates an empty order object for a new
    def new
        # Create an empty order object for the form to use
        @order = Order.new
    end

    # Creates the order into the system
    # Then redirects to another new order page
    def create

    end

    # Loads the Order into the fields for it to be updated
    def edit

    end

    # updates the order then redirects back
    def update

    end
end
