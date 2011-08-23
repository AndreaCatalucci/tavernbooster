# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $('button.serve').click ->
    button = $(this)
    my_course_id  = button.attr('data-course-id')
    my_order_id = button.attr('data-order-id')    
    cooked_area = button.siblings('p#number_cooked')
    remaining_area = button.siblings('p#number_needed')
    number_area = button.siblings('#number')
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
        if arg['number_needed'] <= 0
          remove_course_order(my_course_id, my_order_id)
        else
          number_area.val(1)
          number_area.attr('max',arg['number_needed'])
          cooked_area.html(arg['number_cooked'])
          remaining_area.html(arg['number_needed'])
          
  remove_course_order = (course_id,order_id) ->
    course_order_div = $('#course_' + course_id + '_order_' + order_id)
    course_div = course_order_div.parent().parent()
    if course_div.children('.course_order').length <= 1
      course_div.remove()
    else
      course_order_div.remove()