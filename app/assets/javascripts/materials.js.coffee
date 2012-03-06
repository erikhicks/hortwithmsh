# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

window.MaterialForm =
  initialize: ->
    @bindActions()

  bindActions: ->
    $('#create_material_button').click ->
      $('#material_form').submit()
      return false

$(document).ready ->
  MaterialForm.initialize() if $('#material_form').length > 0