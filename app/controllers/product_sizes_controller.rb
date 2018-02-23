class ProductSizesController < ApplicationController
    def create
        @product_size = ProductSize.new(product_size_params)

        @product_size.save

    end

    def destroy

    end

    protected
        def product_size_params
            params.require(:product_size).permit(:product_id, :product_size_id,
                :product_size_name)
        end
end
