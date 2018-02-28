/* Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
*/

jQuery(function() {
    // Declared the holding of the sizes & styles
    var product_sizes;
    var product_styles;
    // Store the sizing and styles
    product_sizes = $('#order_product_sizes_id').html();
    product_styles = $('#order_product_styles_id').html();
    // Initially disable the size & style select boxes
    $('#order_product_sizes_id').prop('disabled', true);
    $('#order_product_styles_id').prop('disabled', true);

    // On the changing of the products select, allocate
    // the size & style select boxes
    return $('#order_products_id').change(function() {
        product = $('#order_products_id :selected').text(); // Get the product name
        // Add any necessary escapes
        escaped_product = product.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
        // Get the size & style options for that product
        size_options = $(product_sizes).filter('optgroup[label="'+escaped_product+'"]').html();
        style_options = $(product_styles).filter('optgroup[label="'+escaped_product+'"]').html();

        // If there is size options fill the select box
        // otherwise disable it and empty it
        if (size_options) {
            $('#order_product_sizes_id').html(size_options);
            $('#order_product_sizes_id').prop('disabled', false);
        }else {
            $('#order_product_sizes_id').empty();
            $('#order_product_sizes_id').prop('disabled', true);
        }

        // If there is style options fill the select box
        // otherwise disable it and empty it
        if (style_options) {
            $('#order_product_styles_id').html(style_options);
            $('#order_product_styles_id').prop('disabled', false);
        } else {
            $('#order_product_styles_id').empty();
            $('#order_product_styles_id').prop('disabled', true);
        }
    });
});
