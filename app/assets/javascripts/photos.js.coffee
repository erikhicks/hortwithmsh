# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

window.Photos = 
  init: ->
    @load()

  load: ->
    url = 'http://graph.facebook.com/545940445428020/photos'
    
    $.ajax {
      url: url,
      dataType: 'json',
      success: (data) ->
        Photos.processPhotos(data)
    }
  
  processPhotos: (data) ->
    console.log data