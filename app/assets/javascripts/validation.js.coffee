$ ->
  $('form .validating').each ->
    $prev = $(@).prev()
    $prev.html($prev.html() + ' *')

  # For now, just existing
  is_valid = (input)->
    !!input.value

  $("#signup form#new_user").submit (e)->
    validated = true
    $('form .validating').each ->
      $parent = $(@).parent()
      $(@).keyup ->
        if is_valid(@)
          $parent.removeClass('has-error').addClass('has-success')
        else
          $parent.removeClass('has-success').addClass('has-error')

      if !is_valid(@)
        $parent.addClass('has-error')
        @.focus()
        validated = false
      true

    !!validated

