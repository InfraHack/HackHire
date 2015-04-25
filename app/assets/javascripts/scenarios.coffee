# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('button.start').on('click', ->
    console.log 'clicked'
    $('.before').addClass('hidden')
    $('.after').removeClass('hidden')
    $('.message').text('Your server is on 123.456.789.012 (not really)')
  )
  $('button.finished').on('click', ->
    $('.message').text('You have failed!')
  )

