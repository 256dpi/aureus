//= require_directory ./plugins
//= require ./extensions
//= require ./defaults
//= require ./functions
//= require_self

$(document).ready(function(){
  
  $("td.buttons a").wrapInner("<span/>");
  
  //$(".datepicker").datepicker(datepickerConfiguration);
  
  // Prevent Bug
  //$("div.ui-datepicker").hide();
  
  //$(".timepicker").calendricalTime(timepickerConfiguration);
  
  //$.fn.qtip.styles.single = tooltipConfiguration;
  
});