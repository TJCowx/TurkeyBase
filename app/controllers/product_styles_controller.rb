class ProductStylesController < ApplicationController
    def create
        @product_style = ProductStyle.new(product_style_params)
        @product_style.save
    end

    def destroy
        ProductStyle.find(params[:id]).destroy     # Deletes the pickup date
        # Show user success message, redirect back
        flash[:success] = "Size was successfully deleted!"
        redirect_back fallback_location: '/products'
    end

    def toggle
        @style = ProductStyle.find(params[:id]).toggle_active!
        redirect_back fallback_location: '/products'
    end

    private
        def product_style_params
            params.require(:product_style).permit(:product_id, :product_style_id,
                :product_style_name)
        end
end
