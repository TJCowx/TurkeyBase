class ProductStylesController < ApplicationController
    
    def create
        @product_style = ProductStyle.new(product_style_params)

        # Check to see if the style already exists inside that product
        if ProductStyle.exists?(:product_style_name => @product_style.product_style_name,
            :product_id => @product_style.product_id)

            # If it exists, show user and redirect back
            flash[:danger] = "This product already has this style"
            redirect_back fallback_location: '/products'
        else
            #If save the style
            if @product_style.save
                # Show user success message then redirect back
                flash[:success] = "#{@product_style.product_style_name} was
                    successfully added!"
                redirect_back fallback_location: '/product'
            else
                # Show user error message and redirect back
                flash[:danger] = "Invalid style"
                redirect_back fallback_location: '/product'
            end
        end
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
                :product_style_name, :active_style)
        end
end
