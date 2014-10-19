//= require jquery
//= require jquery_ujs

function aureus(options) {
  window.__aureus = { options: jQuery.extend({}, options || {}) };
  _aureus_remove_messages_after(window.__aureus.options.remove_messages_after);
  _aureus_dropdown();
}

function _aureus_remove_messages_after(seconds) {
  setTimeout(function() {
    $('.aureus-messages p').fadeOut();
  }, seconds*1000);
}

function _aureus_dropdown() {
  $('.dropdown-accessor').click(function(){
    $(this).parent().toggleClass('active');
  });
}
