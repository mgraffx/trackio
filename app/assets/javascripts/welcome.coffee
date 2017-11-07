# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(window).load ->
  acc = document.getElementsByClassName('accordion')
  console.log acc.length
  console.log acc[0]
  console.log acc[1]
  i = undefined
  i = 0
  while i < acc.length
    acc[i].onclick = ->
      console.log acc[i]
      @classList.toggle 'active'
      @nextElementSibling.classList.toggle 'show'
      return
    i++
return
