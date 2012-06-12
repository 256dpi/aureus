// Column Configurator for Datatables
function datatablesColumnConf(table) {
  var ret = Array();
  table.children("thead").children("tr").children("th").each(function(){
    if($(this).hasClass("no-sorting")) {
      ret.push({ bSortable: false });
    } else if($(this).hasClass("date-sorting")) {
      ret.push({ sType: "date-eu" });
    } else {
      ret.push(null);
    }
  });
  return ret;
}

function triggerForm(selector) {
 $(selector).submit();
}