# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

google.load "gdata", "2.x"
google.load "jquery", "1.7.1"

window.Page = 
  init: ->
    @loadCalendar()
    Blog.init() if $('#blog').length > 0

  loadCalendar: ->
    url = 'https://www.google.com/calendar/feeds/fpl1hsa31339j8ksb8gsl1cnas%40group.calendar.google.com/public/full'
    calendarService = new google.gdata.calendar.CalendarService 'hortwithmsh'
    calendarService.getEventsFeed url, Page.handleCalendarFeed, Page.handleCalendarError

  handleCalendarFeed: (results) ->
    entries = results.feed.entry

    # for entry in entries
    #   console.log entry.getTitle().getText()
    #   console.log entry.getTimes()[0]

  handleCalendarError: (results) ->
    # console.log results