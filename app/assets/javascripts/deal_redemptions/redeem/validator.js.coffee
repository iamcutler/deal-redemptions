root = exports ? this

class root.Validator extends Redemption
  email_address: (email) ->
    emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/

    if emailReg.test email
      return true

    return false

  form: (callback) ->
    self = @
    count = 0

    $.each($("form[name='redemptionForm'] input"), (key, value) ->
      if value.value == '' && $(value).prop 'required'
        count++

      if value.type == 'email' && count == 0
        if !self.email_address(value.value)
          self.display_code_message('Please provide a valid email address.')
    )

    # If all required fields are met
    # return callback function
    if typeof callback == 'function'
      callback(count)

  validate_code: (code, callback) ->
    $.getJSON("/validate/code/#{@.get_company_from_uri()}/#{code}", (response) ->
      if typeof callback == 'function'
        callback response
    ).error(() ->
      false
    )