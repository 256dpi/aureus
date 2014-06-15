//= require jquery
//= require jquery_ujs
//= require leaflet
//= require mapbox

var aureus_default_options = {
  mapbox_id: 'the_id'
};

function aureus(options) {
  window.__aureus = { options: jQuery.extend({}, aureus_default_options, options || {}) };
  _aureus_remove_messages_after(window.__aureus.options.remove_messages_after);
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

function _aureus_simple_map() {
  $('.aureus-simple-map').each(function(){
    var el = $(this);
    el.height(el.data('height'));
    var pos = [el.data('latitude'), el.data('longitude')];
    var lmap = L.mapbox.map(this, window.__aureus.options['mapbox_id'],{attributionControl: false}).setView(pos, el.data('zoom'));
    L.marker(pos).addTo(lmap);
  });
}

function _aureus_dropdown() {
  $('.dropdown-accessor').click(function(){
    $(this).parent().toggleClass('active');
  });
}
