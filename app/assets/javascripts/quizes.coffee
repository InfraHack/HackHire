# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('form').on('submit', (e) ->
    e.preventDefault()
    target = $(e.target)
    checked = $(':checked', "form##{target.attr('id')}")
    all = $("form##{target.attr('id')} input[type='checkbox']")
    choices = _.map(all, (item) ->
      $(item).val()
    )
    answers = _.map(checked, (item) ->
      $(item).val()
    )
    $.ajax(url: target.attr('action'), data: { answers: answers, choices: choices }, type: 'post', success: (result) ->
      display = $(target.siblings('.display')[0])
      if result['correct']
        display.text('Correct')
        display.addClass('correct')
        display.removeClass('incorrect')
      else
        display.text('Incorrect')
        display.addClass('incorrect')
        display.removeClass('correct')
    )
  )
