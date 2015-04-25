# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  console.log 'ready'
  $('form').on('submit', (e) ->
    e.preventDefault()
    target = $(e.target)
    answer = $(':checked', "form##{target.attr('id')}").val()
    $.ajax(url: target.attr('action'), data: { answer: answer }, type: 'post', success: (result) ->
      display = $(target.siblings('.display')[0])
      console.log display
      if result['correct']
        console.log 'correct'
        display.text('Correct')
        display.addClass('correct')
      else
        console.log 'incorrect'
        display.text('Incorrect')
        display.addClass('incorrect')
    )
  )

