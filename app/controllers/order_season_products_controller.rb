class OrderSeasonProductsController < ApplicationController
    # Adds the order season product
    def create
        @product = OrderSeasonProduct.new(order_season_product_params)
        if OrderSeasonProduct.exists?(:order_seasons_id => @product.order_seasons_id,
            :products_id => @product.products_id)
            # If the product already is in this season show errors or redirect back
            flash[:danger] = "This product already exists in this season!"
            redirect_back fallback_location: "/order_season"
        else
            if @product.save
                @new_product = Product.find_by(product_id: @product.products_id)
                flash[:success] = "#{@new_product.product_name} has been successfully added"
                redirect_back fallback_location: "/order_season"
            else
                flash[:danger] = "The product was not added!"
                redirect_back fallback_location: "/order_season"
            end
        end
    end

    # Removed the order season product
    def destroy
        @product = OrderSeasonProduct.find(params[:id])
        @product.destroy   # Deletes the product from the season

        # Deletes any order with the product in this season
        @orders = Order.find_by(products_id: @product.products_id, order_season_id: @product.order_seasons_id)
        if @orders
            @orders.destroy
        end

        flash[:success] = "The product was successfully removed!"
        redirect_back fallback_location: '/order_season'
    end

    protected
        # Get the parameters allowed for the order season product
        def order_season_product_params
            params.require(:order_season_product).permit(:order_seasons_id, :products_id)
        end
end
