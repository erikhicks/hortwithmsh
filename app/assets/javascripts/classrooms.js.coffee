# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

window.ClassroomForm =
  initialize: ->
    @bindActions()

  bindActions: ->
    $('#save_changes').click ->
      $('#classroom_form').submit()

$(document).ready ->
  ClassroomForm.initialize() if $('#classroom_form').length > 0