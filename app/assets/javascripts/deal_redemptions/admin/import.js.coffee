$(document).ready ->
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
    format: 'mm-dd-yyyy'
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
    format: 'mm-dd-yyyy'
    onRender: (date) ->
      return date.valueOf() <= checkin.date.valueOf() ? 'disabled' : ''

  }).on('changeDate', (ev) ->
    checkout.hide()
  ).data('datepicker')