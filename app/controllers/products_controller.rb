class ProductsController < ApplicationController

    # For the new view. Loads a new product
    def new
        @product = Product.new
    end

    # Saves the product into the database
    def create
        # Get the product parameters
        @product = Product.new(product_params)

        # Save the product, if it doesn't save show errors, else show success message
        # and redirect to the products index page
        if @product.save
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
            flash[:danger] = "Couldn't delete product, incorrect password."
        end
    end

    # Gets the product that needs to be edited
    def edit
        @product = Product.find(params[:id])
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

    private
        def product_params
            params.require(:product).permit(:product_id, :product_name)
        end
end
