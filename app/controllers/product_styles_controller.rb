class ProductStylesController < ApplicationController
    # def create
    #     @product_style = ProductStyle.new(product_style_params)
    #     @product_style.save
    # end

    private
        def product_style_params
            params.require(:product_style).permit(:product_id, :product_style_id,
                :product_style_name)
        end
end
