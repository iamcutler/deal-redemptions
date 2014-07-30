# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.

# Add duplicate detection on array prototype
Array.prototype.duplicate_values = () ->
  sorted = this.sort()

  for i, index in sorted
    if sorted[index] == sorted[index - 1] || sorted[index] == sorted[index + 1]
      return true

  return false

$(document).ready () ->
  # Instantiate redemption class
  redemption = new Redemption
  validation = new Validator

  # Add additional redemption codes
  $('.add-button').bind 'click', () ->
    redemption.add_redeem_code()
    false

  # On change event, validate current code fields
  $(document).on 'change', "input[name^='redemption[redeem_code]']", () ->
    self = @
    redemption.search_for_duplicate_entries("input[name^='redemption[redeem_code]']", (response) ->
      if response
        redemption.display_code_message("Please provide unique redemption codes.")
      else
        if self.value != ''
          validation.validate_code(self.value, (response) ->
            if response.status == true
              $(self).parent().removeClass('has-error').addClass('has-success')
            else
              $(self).parent().addClass('has-error')
              redemption.display_code_message("Please provide valid redemption code(s).")
          )
    )

  # Form submission
  $("button[type='submit']").bind 'click', () ->
    validation.form((data) ->
      if data == 0
        return true
      else
        redemption.display_code_message('Please fill out all required fields.')
        return false
    )