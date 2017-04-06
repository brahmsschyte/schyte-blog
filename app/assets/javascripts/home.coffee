# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

startTime = ->
  today = new Date
  date = today.toISOString().substring(0, 10)
  h = today.getHours()
  m = today.getMinutes()
  s = today.getSeconds()
  m = checkTime(m)
  s = checkTime(s)
  document.getElementById('clock').innerHTML = date + ' ' + h + ':' + m + ':' + s
  t = setTimeout(startTime, 500)
  return

checkTime = (i) ->
  if i < 10
    i = '0' + i # add zero in front of numbers < 10
  i

$(document).on 'turbolinks:load', ->
  startTime()