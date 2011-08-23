$ ->
  $('button.free_table').button()
  $('button.free_table').click ->
    table_area = $(this).parent()
    old_waiter_id = table_area.attr('data-waiter-id')
    table_id = table_area.attr('data-id')
    $.ajax 
      type: 'PUT'
      url: '/tables/update'
      dataType: 'json'
      data:
        table_id: table_id
      success: (arg) ->            
        table_area.attr('data-waiter-id', null)
        table_area.addClass('free')
        table_area.removeClass('occupied')
        table_area.children('.waiter_username').html('')
        table_area.children('.waiter_first_name').html('')
        table_area.children('.waiter_last_name').html('')
        old_waiter_area = $('#user_' + old_waiter_id.toString())
        old_waiter_table_count = parseInt($(old_waiter_area).find('#table_count').html()) - 1
        $(old_waiter_area).find('#table_count').html(old_waiter_table_count)
    
  $('.user').draggable(revert: true)
  $('.table').droppable
      drop: (event, ui) ->
        drop_area = $(this)
        drag_area = ui.draggable[0]
        table_id = drop_area.attr('data-id')
        new_waiter_id = ui.draggable[0].getAttribute('data-id')
        old_waiter_id = drop_area.attr('data-waiter-id')
        if new_waiter_id != old_waiter_id
          $.ajax 
            type: 'PUT'
            url: '/tables/update'
            dataType: 'json'
            data:
              table_id: table_id
              waiter_id: new_waiter_id
            success: (arg) ->
              drop_area.children('button').show            
              drop_area.attr('data-waiter-id', new_waiter_id)
              drop_area.removeClass('free')
              drop_area.addClass('occupied')
              drop_area.children('.waiter_username').html(arg['waiter']['username'])
              drop_area.children('.waiter_first_name').html(arg['waiter']['first_name'])
              drop_area.children('.waiter_last_name').html(arg['waiter']['last_name'])
              new_waiter_table_count = parseInt($(drag_area).find('#table_count').html()) + 1
              $(drag_area).find('#table_count').html(new_waiter_table_count)
              old_waiter_area = $('#user_' + old_waiter_id.toString())
              old_waiter_table_count = parseInt($(old_waiter_area).find('#table_count').html()) - 1
              $(old_waiter_area).find('#table_count').html(old_waiter_table_count)