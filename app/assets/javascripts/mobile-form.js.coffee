window.Form =
  init: ->
    @data = {}
    @plant_info = null
    @isValid = true
    @setupEvents()

  setupEvents: -> 
    $('#plant-identification-button').click ->
      Form.isValid = true
      Form.checkRequiredField($('#plant-id-number'))
      Form.data['plant-id'] = $('#plant-id-number').val()
      Form.saveData()
      Form.getPlantData()
      return false if !Form.isValid

    $('#greenhouse-info-button').click ->
      Form.collectData $('#greenhouse-info')
      Form.saveData()
      return false if !Form.isValid

    $('#basic-info-button').click ->
      Form.collectData $('#basic-info-form')
      return false if !Form.isValid
      Form.sendData()

    $('#welcome-form-button').click ->
      Form.collectData $('#welcome')
      return false if !Form.isValid

    $('#flowers-or-buds').change ->
      $('#flowers-details .ui-collapsible-content').toggle()

    $('#fruits').change ->
      $('#fruits-details .ui-collapsible-content').toggle()

  collectData: (form) ->
    Form.isValid = true
    $('label, input').removeClass('required')

    $.each form.find('input, textarea'), (key, val) ->
      Form.checkRequiredField($(val));
      Form.data[$(val).attr('name')] = $(val).val()

    $.each form.find('select'), (key, val) ->
      select = $(val)
      Form.data[select.attr('name')] = $(select.find('option:selected')).html()

    console.log(Form.data)

  checkRequiredField: (input) ->
    return if input.hasClass 'optional'
    if input.val() == ''
      Form.isValid = false
      input.addClass('required')
      $('label[for=' + input.attr('name') + ']').addClass('required')

  saveData: ->
    localStorage.setItem('plant-data', JSON.stringify(Form.data))

  sendData: ->
    $.post('/mobile/post-plant-data', Form.data)
      .done (data) ->
        console.log('success');
        $('input, textarea').val('')
      .fail ->
        console.log('failed');
      .always ->
        console.log('finished');

  getPlantData: ->
    $.post('/mobile/get-plant-information', {'id': Form.data['plant-id']})
      .done (data) ->
        console.log('success');
        Form.populatePlantData() if Form.plant_info
      .fail ->
        console.log('failed');
      .always ->
        console.log('finished');

  populatePlantData: ->
    $('.plant-name').html(Form.plant_info.common_name)
    $('.plant-botanical-name').html(Form.plant_info.botanical_name)
    $('#basic-info-description p').html(Form.plant_info.information)

  sendDataSuccess: ->

$(document).ready ->
  Form.init()
