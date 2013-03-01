window.Form =
  init: ->
    @data = {}
    @isValid = true
    @setupEvents()

  setupEvents: -> 
    $('#plant-identification-button').click ->
      Form.isValid = true
      Form.checkRequiredField($('#plant-id-number'))
      Form.data['plant-id'] = $('#plant-id-number').val()
      Form.saveData()
      return false if !Form.isValid

    $('#greenhouse-info-button').click ->
      Form.collectData $('#greenhouse-info')
      Form.saveData()
      return false if !Form.isValid

    $('#basic-info-button').click ->
      Form.collectData $('#basic-info-form')
      return false if !Form.isValid
      Form.sendData()

    $('#flowers-or-buds').change ->
      $('#flowers-details .ui-collapsible-content').toggle()

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

  sendDataSuccess: ->

$(document).ready ->
  Form.init()