//= require jquery
//= require jquery_ujs
//= require leaflet
//= require mapbox
//= require dataTables/jquery.dataTables

var aureus_default_options = {
  mapbox_id: 'the_id'
};

function aureus(options) {
  window.aureus = { options: jQuery.extend({}, aureus_default_options, options || {}) };
  _aureus_remove_messages_after(window.aureus.options.remove_messages_after);
  _aureus_datatables_decorate();
  _aureus_simple_map();
  _aureus_dropdown();
}

function aureus_trigger_form(selector) {
  $(selector).submit();
}

function _aureus_remove_messages_after(seconds) {
  setTimeout(function() {
    $('.aureus-messages p').fadeOut();
  }, seconds*1000);
}

function _aureus_datatables_decorate() {
  $.fn.dataTableExt.oStdClasses.sWrapper = 'datatable-wrapper';
  $('.datatable').each(function(){
    $(this).dataTable({
      sDom: 't',
      oLanguage: _aureus_datatable_translation($(this)),
      bPaginate: false,
      aoColumns: _aureus_datatables_column_configurator($(this))
    });
  });
}

function _aureus_datatable_translation(table) {
  return {
    sSearch : table.data('i18n_sSearch'),
    sLengthMenu: table.data('i18n_sLengthMenu'),
    sZeroRecords: table.data('i18n_sZeroRecords'),
    sInfo: table.data('i18n_sInfo'),
    sInfoEmpty: table.data('i18n_sInfoEmpty'),
    sInfoFiltered: table.data('i18n_sInfoFiltere')
  };
}

function _aureus_datatables_column_configurator(table) {
  return table.children('thead tr th').map(function(){
    if($(this).hasClass('no-sorting')) {
      return { bSortable: false };
    }
    return {};
  });
}

function _aureus_simple_map() {
  $('.aureus-simple-map').each(function(){
    var el = $(this);
    el.height(el.data('height'));
    var pos = [el.data('latitude'), el.data('longitude')];
    var lmap = L.mapbox.map(this, window.aureus.options['mapbox_id'],{attributionControl: false}).setView(pos, el.data('zoom'));
    L.marker(pos).addTo(lmap);
  });
}

function _aureus_dropdown() {
  $('.dropdown-accessor').click(function(){
    $(this).parent().toggleClass('active');
  });
}
