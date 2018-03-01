# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery -> $('#new_style').click (clone) ->
        clone = $('#new_style_fields').clone()
        clone.find('input').val('')
        $('#new_styles').append(clone)
