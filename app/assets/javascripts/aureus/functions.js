function aureus_initialize() {
  _aureus_simple_map();
  _aureus_ipad_compatibility();
}

function aureus_remove_messages_after(seconds) {
  setTimeout(function() {
    $(".aureus-messages p").fadeOut();
  }, seconds*1000);
}

function aureus_setup_i18n(default_locale, current_locale) {
  I18n.defaultLocale = default_locale;
  I18n.locale = current_locale;
}

function aureus_datatables_decorate() {
  $.fn.dataTableExt.oStdClasses.sWrapper = "datatable-wrapper";
  $.fn.dataTableExt.oStdClasses.sLength = "datatable-length";
  $.fn.dataTableExt.oStdClasses.sFilter = "datatable-filter";
  $.fn.dataTableExt.oStdClasses.sInfo = "datatable-info";
  $.fn.dataTableExt.oStdClasses.sPaging = "datatable-paging";
  
  $(".datatable").each(function(){
    $(this).dataTable({
      sDom: "<'toolbar'fi>t",
      oLanguage: aureus_datatable_language_config,
      bPaginate: false,
      aoColumns: aureus_datatables_column_configurator($(this))
    });
  });
  
  $(".datatable-no-toolbar").each(function(){
    $(this).dataTable({
      sDom: "t",
      oLanguage: aureus_datatable_language_config,
      bPaginate: false,
      aoColumns: aureus_datatables_column_configurator($(this))
    });
  });
}

function aureus_trigger_form(selector) {
  $(selector).submit();
}

function aureus_datatables_translate() {
  aureus_datatable_language_config = {
    sSearch : I18n.t("aureus.datatables.search"),
    sLengthMenu: I18n.t("aureus.datatables.lenght_menu"),
    sZeroRecords: I18n.t("aureus.datatables.zero_records"),
    sInfo: I18n.t("aureus.datatables.info"),
    sInfoEmpty: I18n.t("aureus.datatables.info_empty"),
    sInfoFiltered: I18n.t("aureus.datatables.info_filtered")
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