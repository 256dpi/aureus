//= require aureus
//= require_self
//= require_tree .

$(document).ready(function(){
  aureus_remove_messages_after(2);
  aureus_setup_i18n("<%= I18n.default_locale %>","<%= I18n.locale %>");
  aureus_datatables_translate();
  aureus_datatables_decorate();
});
