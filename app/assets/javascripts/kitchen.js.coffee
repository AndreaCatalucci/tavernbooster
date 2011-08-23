# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $('button.serve').click ->
    my_course_id  = $(this).attr('data-course-id')
    my_order_id = $(this).attr('data-order-id')    
    cooked_area = $(this).siblings('p#number_cooked')
    remaining_area = $(this).siblings('p#number_needed')
    number_area = $(this).siblings('#number')
    number = parseInt(number_area.val())
    old_val = parseInt(cooked_area.html())
    $.ajax 
      type: 'PUT'
      url: '/kitchen/orders/cook'
      data:
        course_id : my_course_id 
        order_id : my_order_id
        number: number
      success: (arg) ->
        if number_needed == 0
          alert('finito!')
        else
          number_area.val(1)
          number_area.attr('max',arg['number_needed'])
          console.log(arg)
          cooked_area.html(arg['number_cooked'])
          remaining_area.html(arg['number_needed'])