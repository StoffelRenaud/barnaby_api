function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    let placeAddress = document.getElementById('place_address');

    if (placeAddress) {
      let autocomplete = new google.maps.places.Autocomplete(placeAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(placeAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
