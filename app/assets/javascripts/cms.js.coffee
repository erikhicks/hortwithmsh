$(document).ready ->
  $('.alert').find('a').click ->
    Alert.close()

  $('#create_classroom_button').click ->
    $('#create_classroom_form').submit()

window.Alert =
  show: (message) ->
    $('.alert').find('span').html(message);
    $('.alert').show();

  close: ->
    $('.alert').hide();