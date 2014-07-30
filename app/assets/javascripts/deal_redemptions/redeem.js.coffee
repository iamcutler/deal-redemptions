# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.

Array.prototype.duplicate_values = () ->
  sorted = this.sort()

  for i, index in sorted
    if sorted[index] == sorted[index - 1] || sorted[index] == sorted[index + 1]
      return true

  false

class Redemption
  constructor: (@max) ->
    @number = 1
    @max = @max || 10

  add_redeem_code: () ->
    if @number < @max
      @number++
      $('.row#redemption_codes').append "<div class=\"col-md-6\"><div class=\"form-group\"><label for=\"redemption_redeem_code_code_#{@number}\">Voucher Code #{@number}</label><input class=\"form-control\" id=\"redemption_redeem_code_code_#{@number}\" name=\"redemption[redeem_code][][code]\" type=\"text\"></div></div>"

  # Search for duplicate codes in the input form
  get_inputs_array: (inputs) ->
    inputArray = []

    $.each($(inputs), (key, input) ->
      if input.value != ''
        inputArray.push input.value
    )

    inputArray

  search_for_duplicate_entries: (inputs, callback) ->
    inputs = @.get_inputs_array(inputs)

    if typeof callback == 'function'
      # Find matching values in array if present and return with callback
      callback inputs.duplicate_values()

  get_company_from_uri: () ->
    pathArray = window.location.pathname.split('/')
    pathArray[2]

  validate_code: (code, callback) ->
    $.getJSON("/validate/code/#{@.get_company_from_uri()}/#{code}", (response) ->
      if typeof callback == 'function'
        callback response
    ).error(() ->
      false
    )

  display_code_message: (message, timing) ->
    timing = timing || 3000

    container = $('.code-alert')
    container.html message
    container.slideDown()
    container.delay(timing).slideUp()

  form_validation: (form) ->


$(document).ready () ->
  # Instantiate redemption class
  Redemption = new Redemption

  $('.add-button').bind 'click', () ->
    Redemption.add_redeem_code()
    false

  # On change event, validate current code fields
  $(document).on 'change', "input[name^='redemption[redeem_code]']", () ->
    self = @
    Redemption.search_for_duplicate_entries("input[name^='redemption[redeem_code]']", (response) ->
      if response
        Redemption.display_code_message("Please provide unique redemption codes.")
      else
        Redemption.validate_code(self.value, (response) ->
          if response.status == true
            $(self).parent().removeClass('has-error').addClass('has-success')
          else
            $(self).parent().addClass('has-error')
            Redemption.display_code_message("Please provide valid redemption code(s).")
        )
    )