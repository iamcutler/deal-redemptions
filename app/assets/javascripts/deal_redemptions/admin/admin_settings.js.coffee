# JS File to handle admin interface

class Validator
  email_address: (email) ->
    regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/
    regex.test email

  form: (options) ->
    options = options || {}
    count = 0
    self = @

    $("#{options.form} input[required]").each(() ->
      if @.value != ''
        $(@).parent().removeClass 'has-error'
      else
        $(@).parent().addClass 'has-error'
        count++

      if $(@).prop('type') == 'email'
        if self.email_address(@.value)
          $(@).parent().removeClass 'has-error'
        else
          $(@).parent().addClass 'has-error'
          count++
    )

    if count == 0 then true else false

$(document).ready ->
  $('form#newUserForm').submit ->
    validate = new Validator
    if validate.form({form: 'form#newUserForm'})
      alert 'VALID'
    return false