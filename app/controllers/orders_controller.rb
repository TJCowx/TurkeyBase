class OrdersController < ApplicationController
    include ApplicationHelper
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
        @order = Order.new(order_params)
        if @order.save
            flash[:success] = "#{@order.cust_fname} #{@order.cust_lname}'s order has been added!'"
            redirect_to products_path
        else
            render 'new'
        end
    end

    # Loads the Order into the fields for it to be updated
    def edit
        @order = Order.find(params[:id])
    end

    # updates the order then redirects back
    def update
        redirect_to list_orders_path(current_season)
    end

    protected
        def order_params
            params.require(:order).permit(:order_id, :cust_fname, :cust_lname,
                :cust_phone, :products_id, :product_sizes_id, :product_styles_id,
                :pickup_dates_id, :order_requests, :users_id, :order_season_id)
        end
end
