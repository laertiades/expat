# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

reload = ->
  filter = false
  height = window.innerHeight - 270
  oTable = $('.datatable').dataTable({
    "sScrollY": height,
    "aLengthMenu": [20, 50, 200, 1000],
    "iDisplayLength": 50,
    "bSort": false })
  billableFilter = ( oSettings, aData, iDataIndex ) ->
    if !filter then true
    else if aData[6] == "" then false
    else if aData[26] == "$0.00" then false
    else true
  $.fn.dataTableExt.afnFiltering.push billableFilter

  $('<button id="filter" class="btn btn-primary">Billable Accounts</button>').appendTo 'div.dataTables_filter'
  $('#filter').on "click", =>
    filter = !filter
    oTable.fnDraw()
    if !filter
      $('#filter').removeClass "btn-default"
      $('#filter').addClass "btn-primary"
    else
      $('#filter').addClass "btn-default"
      $('#filter').removeClass "btn-primary"

$(document).on 'page:load', reload

$ -> reload()
