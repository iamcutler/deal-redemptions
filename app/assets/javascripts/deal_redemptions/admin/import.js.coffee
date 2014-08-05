$(document).ready ->
  $('i.csv-tip').tooltip({
    html: true
    placement: 'right'
    trigger: 'hover'
    template: '<img src="/assets/admin/csv-demo.jpg" alt="" />'
    viewport: 'col-md-4'
  })