$ ->
  $('form .validating').each ->
    $prev = $(@).prev()
    $prev.html($prev.html() + ' *')

  attachmentsSizeIsValid = ->
    $attachments = $("#signup form#new_user #attachments")[0]

    if $attachments && $attachments.files.length > 0
      for attachment in $attachments.files
        # The size limit of the file is <4MB
        if attachment.size / 1000 / 1000 > 4
          unless $($attachments).parent().find('div.has-error').length
            $($attachments).parent().append("<div class='has-error'>请上传小于4MB的文件！</div>")
          return false

    $($attachments).parent().find('div.has-error').remove()
    return true

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

    !!validated && attachmentsSizeIsValid()

