//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require_directory ./plugins
//= require ./functions
//= require_self

var datatablesLanguageConfig = {
  sSearch : "Suchen:",
  sLengthMenu: "Zeige _MENU_ Einträge pro Seite",
  sZeroRecords: "Keine Daten gefunden",
  sInfo: "Zeige _START_ bis _END_ von _TOTAL_ Einträgen",
  sInfoEmpty: "Zeige 0 Einträge",
  sInfoFiltered: "(Total _MAX_ Einträge)"
};

$(document).ready(function(){
  
  $.fn.dataTableExt.oStdClasses.sWrapper = "datatable-wrapper"
  $.fn.dataTableExt.oStdClasses.sLength = "datatable-length"
  $.fn.dataTableExt.oStdClasses.sFilter = "datatable-filter"
  $.fn.dataTableExt.oStdClasses.sInfo = "datatable-info"
  $.fn.dataTableExt.oStdClasses.sPaging = "datatable-paging"
  
  $('.datatable').each(function(){
    $(this).dataTable({
      sDom: '<"toolbar"fi>t',
      oLanguage: datatablesLanguageConfig,
      bPaginate: false,
      aoColumns: datatablesColumnConf($(this))
    });
  });
  
  $('.datatable-no-toolbar').each(function(){
    $(this).dataTable({
      sDom: 't',
      oLanguage: datatablesLanguageConfig,
      aoColumns: columnConf($(this))
    });
  });
  
  $(".datepicker").datepicker(datepickerConfiguration);
  
  // Prevent Bug
  $("div.ui-datepicker").hide();
  
  $(".timepicker").calendricalTime(timepickerConfiguration);
  
  $.fn.qtip.styles.single = tooltipConfiguration
  
});