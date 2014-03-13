var aureus_default_options = {
  mapbox_id: 'the_id'
};

function aureus_initialize(options) {
  window.aureus = { options: jQuery.extend({}, aureus_default_options, options || {}) };
  _aureus_remove_messages_after(window.aureus.options.remove_messages_after);
  _aureus_datatables_decorate();
  _aureus_simple_map();
  _aureus_ipad_compatibility();
}

function _aureus_remove_messages_after(seconds) {
  setTimeout(function() {
    $(".aureus-messages p").fadeOut();
  }, seconds*1000);
}

function _aureus_datatables_decorate() {
  $.fn.dataTableExt.oStdClasses.sWrapper = "datatable-wrapper";
  $.fn.dataTableExt.oStdClasses.sLength = "datatable-length";
  $.fn.dataTableExt.oStdClasses.sFilter = "datatable-filter";
  $.fn.dataTableExt.oStdClasses.sInfo = "datatable-info";
  $.fn.dataTableExt.oStdClasses.sPaging = "datatable-paging";
  
  $(".datatable").each(function(){
    $(this).dataTable({
      sDom: "<'toolbar'fi>t",
      oLanguage: _aureus_datatable_translation(this),
      bPaginate: false,
      aoColumns: aureus_datatables_column_configurator($(this))
    });
  });
  
  $(".datatable-no-toolbar").each(function(){
    $(this).dataTable({
      sDom: "t",
      oLanguage: _aureus_datatable_translation(this),
      bPaginate: false,
      aoColumns: aureus_datatables_column_configurator($(this))
    });
  });
}

function aureus_trigger_form(selector) {
  $(selector).submit();
}

function _aureus_datatable_translation(table) {
  var el = $(table);
  return {
    sSearch : el.data('i18n_sSearch'),
    sLengthMenu: el.data('i18n_sLengthMenu'),
    sZeroRecords: el.data('i18n_sZeroRecords'),
    sInfo: el.data('i18n_sInfo'),
    sInfoEmpty: el.data('i18n_sInfoEmpty'),
    sInfoFiltered: el.data('i18n_sInfoFiltere')
  };
}

/* private */

function aureus_datatables_column_configurator(table) {
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
