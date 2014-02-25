# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

imageLinks = ( element ) ->
  $(element).hover(
    ->
      $(this).stop()
      $(this).fadeTo "fast", .5
    ->
      $(this).stop()
      $(this).fadeTo "fast", 1
  )

$ -> imageLinks(".button-fade")
