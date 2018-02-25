class ProductsController < ApplicationController

    # For the new view. Loads a new product
    def new
        @product = Product.new
        @product_size = @product.product_sizes.build
        @product_style = @product.product_styles.build
    end

    # Saves the product into the database
    def create
        # Get the product parameters
        @product = Product.new(product_params)

        # Save the product, if it doesn't save show errors, else show success message
        # and redirect to the products index page
        if @product.save
            @product_style = ProductStyle.new(:product_id => @product.product_id,
                :product_style_name => product_params[:style],
                :active_style => product_params[:select_style])
            @product_style.save
            @product_size = ProductSize.new(:product_id => @product.product_id,
                :product_size_name => product_params[:size],
                :active_size => product_params[:select_size])
            @product_size.save
            flash[:success] = "#{@product.product_name} has been added"
            redirect_to products_path
        else
            render 'new'
        end
    end

    # For the index view, lists all the products
    def index
        # Get all the products
        @products = Product.all
    end

    # Deletes the product
    def destroy
        # Get the product to delete
        @product = Product.find(params[:id])

        # Delete the product with success message
        # Show error if it in't successful
        if @product.destroy
            flash[:success] = "#{@product.product_name} successfully deleted"
            redirect_to products_path
        else
            redirect_to products_path
            flash[:danger] = "Couldn't delete product."
        end
    end

    # Gets the product that needs to be edited
    def edit
        @product = Product.find(params[:id])
        @product_style = ProductStyle.where(:product_id => @product.product_id)
    end

    # Updates the product
    def update
        # Get the product to be updated
        @product = Product.find(params[:id])

        # Update the attributes, if not updated show errors
        if @product.update_attributes(product_params)
            flash[:success] = "#{@product.product_name} has been updated!"
            redirect_to products_path
        else
            render 'edit'
        end
    end

    protected
        def product_params
            params.require(:product).permit(:product_id, :product_name, :style,
                :size, :select_size, :select_style)
        end
end
