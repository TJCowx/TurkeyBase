class ProductSizesController < ApplicationController
    def create
        @product_size = ProductSize.new(product_size_params)

        # Check to see if the sizee already exists inside that product
        if ProductSize.exists?(:product_size_name => @product_size.product_size_name,
            :product_id => @product_size.product_id)
            # If it exists, show user and redirect back
            flash[:danger] = "This product already has this size"
            redirect_back fallback_location: '/products'
        else
            #If save the style
            if @product_size.save
                # Show user success message then redirect back
                flash[:success] = "#{@product_size.product_size_name} was
                    successfully added!"
                redirect_back fallback_location: '/product'
            else
                # Show user error message and redirect back
                flash[:danger] = "Invalid size"
                redirect_back fallback_location: '/product'
            end
        end

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
                :product_size_name, :active_size)
        end
end
