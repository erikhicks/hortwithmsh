# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

window.Blog = 
  init: ->
    @load()

  load: ->
    url = 'http://blog.washingtonstem.org/blog/author/alisonhitchcock/rss'
    
    $.ajax {
      url: document.location.protocol + '//ajax.googleapis.com/ajax/services/feed/load?v=1.0&num=10&callback=?&q=' + encodeURIComponent(url),
      dataType: 'json',
      success: (data) ->
        Blog.processPosts(data.responseData.feed.entries)
    }
  
  processPosts: (data) ->
    $.each data, (index, post) ->
      article = $('<article>');
      title = $('<h1>').html($('<a>').html(post.title).attr('href',post.link.replace('://washingtonstem.org','://blog.washingtonstem.org')));
      content = $('<p>').html(post.content);
      readMoreLink = $('<span>').html($('<a>').html('Read More &gt;').attr('href',post.link.replace('://washingtonstem.org','://blog.washingtonstem.org')));

      title.appendTo(article);
      content.appendTo(article);
      readMoreLink.appendTo(article);

      article.appendTo($('#blog'));