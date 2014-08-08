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

class Navigation
  mobile: () ->
    $('section#mobile-navigation select').bind 'change', () ->
      window.location.href = @.value


$(document).ready ->
  navigation = new Navigation

  # Responsive mobile navigation
  navigation.mobile()

  $('i.csv-tip').tooltip({
    container: 'body'
    html: true
    placement: 'right'
    trigger: 'hover'
    template: '<img src="/assets/admin/csv-demo.jpg" alt="" />'
    viewport: 'col-md-4'
  })

  nowTemp = new Date()
  now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0)

  checkin = $('input#exportStartDate').datepicker({
    format: 'yyyy-mm-dd'
    onRender: (date) ->
      return date.valueOf() < now.valueOf() ? 'disabled' : ''

  }).on('changeDate', (ev) ->
    if ev.date.valueOf() > checkout.date.valueOf()
      newDate = new Date(ev.date)
      newDate.setDate(newDate.getDate() + 1)
      checkout.setValue(newDate)

    checkin.hide()

    $('input#exportEndDate').focus()
  ).data('datepicker')

  checkout = $('#exportEndDate').datepicker({
    format: 'yyyy-mm-dd'
    onRender: (date) ->
      return date.valueOf() <= checkin.date.valueOf() ? 'disabled' : ''

  }).on('changeDate', (ev) ->
    checkout.hide()
  ).data('datepicker')