function _aureus_simple_map() {
  $(".aureus-simple-map").each(function(){
    var el = $(this);
    el.height(el.data("height"));
    var pos = [el.data("latitude"), el.data("longitude")];
    var lmap = L.mapbox.map(this,"map-box-id",{attributionControl: false}).setView(pos, el.data("zoom"));
    L.marker(pos).addTo(lmap);
  });
}

function _aureus_ipad_compatibility() {
  $(".dropdown-accessor").click(function(){
    $(this).parent().toggleClass("active");
  });
}