/* Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/ */
jQuery(function() {
    $(document).ready(function(){
        // Instantiate the datatable
        var table = $('#orders').DataTable({
            'columnDefs' : [{
                'targets' : [8],
                'orderable' : false
            }]
        });
    });
});
