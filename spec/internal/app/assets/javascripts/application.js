//= require aureus
//= require_self
//= require_tree .

$(function(){
  aureus_initialize({});
  aureus_remove_messages_after(2);
  aureus_datatables_decorate();
});
