$(document).ready ->
  $('.alert').find('a').click ->
    Alert.close()

  $('#create_classroom_button').click ->
    $('#create_classroom_form').submit()

  $('#add_unit_submit_button').click ->
    $('#add_unit_form').submit()

  $('#rename_material_button').click ->
    materials_id = $('#rename_material_form').find('#rename_material_id').val()
    $('#rename_material_form').attr('action', '/materials/' + materials_id + '/edit_name')
    $('#rename_material_form').submit()
    return false

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

    $('.edit-material').click -> 
      CMS.editMaterialClick()

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

  editMaterialClick: ->
    button = $(event.target);
    material_id = button.data('id')
    material_name = button.data('name')
    console.log(material_id, material_name);

    $('#edit_material').find('#material_name').val(material_name);
    $('#edit_material').find('#rename_material_id').val(material_id);

