class ProductSizesController < ApplicationController
    def create
        @product_size = ProductSize.new(product_size_params)

        @product_size.save

    end

    def destroy
        ProductSize.find(params[:id]).destroy     # Deletes the pickup date
        # Show user success message, redirect back
        flash[:success] = "Size was successfully deleted!"
        redirect_back fallback_location: '/products'
    end

    def toggle
        @size = ProductSize.find(params[:id]).toggle_active!
        redirect_back fallback_location: '/products'
    end

    protected
        def product_size_params
            params.require(:product_size).permit(:product_id, :product_size_id,
                :product_size_name)
        end
end
