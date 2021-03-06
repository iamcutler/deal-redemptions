root = exports ? this

class root.Redemption
  constructor: (@max) ->
    @number = 0
    @max = @max || 9

  add_redeem_code: () ->
    if @number < @max
      @number++
      $('.row#redemption_codes').append "<div class=\"col-md-6\"><div class=\"form-group\"><label for=\"redeem_codes[]\">Voucher Code #{@number + 1}</label><input class=\"form-control\" id=\"redeem_codes_#{@number}_code\" name=\"redeem_codes[]\" type=\"text\"></div></div>"

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

  display_code_message: (message, timing) ->
    timing = timing || 8000

    container = $('.code-alert')
    container.html message
    container.slideDown()
    container.delay(timing).slideUp()