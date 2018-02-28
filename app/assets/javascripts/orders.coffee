# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
    product_sizes = $('#order_product_sizes_id').html()
    product_styles = $('#order_product_styles_id').html()
    console.log('sizes: ' + product_sizes)
    $('#order_products_id').change ->
        product = $('#order_products_id :selected').text()
        escaped_product = product.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
        size_options = $(product_sizes).filter('optgroup[label="#{escaped_product}"]').html()
        #console.log('size: ' + escaped_product + ", " + size_options)
        style_options = $(product_styles).filter('optgroup[label="#{escaped_product}"]').html()
        if size_options
            console.log(product_sizes)
            $('#order_product_sizes_id').html(size_options)
        else
            $('#order_product_sizes_id').empty()

        if style_options
            $('#order_product_styles_id').html(style_options)
        else
            $('#order_product_styles_id').empty()
