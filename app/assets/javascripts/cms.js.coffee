$(document).ready ->
  $('.alert').find('a').click ->
    Alert.close()

  $('#create_classroom_button').click ->
    $('#create_classroom_form').submit()

  $('#add_unit_submit_button').click ->
    $('#add_unit_form').submit()

  CMS.init()

window.Alert =
  show: (message) ->
    $('.alert').find('span').html(message)
    $('.alert').show()

  close: ->
    $('.alert').hide()

window.CMS =
  init: ->
    $('.sortable').sortable({
      update: (event, ui) ->
        CMS.updateSort(event, ui)
    })

  updateSort: (event, ui) ->
    itemList = ui.item.parent().find('.row')
    itemType = ui.item.parent()[0].id
    orderedList = []

    $.each itemList, (index, item) ->
      orderedList.push $(item).data('id')
    
    $.ajax({
      type: 'POST',
      url: '/classrooms/sort',
      data: {'list': orderedList, 'type': itemType}
      # success: success,
      # dataType: dataType
    })