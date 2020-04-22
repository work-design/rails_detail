$('#taxon_item_list_id').dropdown({
  onChange: function(value, text, $selectedItem){
    var search_path = '/items/search'
    var search_url = new URL(window.location.origin + search_path)
    search_url.searchParams.set('list_id', value)
    fetch(search_url).then(function(response){
      return response.json();
    }).then(function(response){
      $('#taxon_item_item_id').dropdown('clear').dropdown('setup menu', response);
    })
  }
})

$('#taxon_item_item_id').dropdown({
  onChange: function(value, text, $selectedItem){
    $('#taxon_item_real_item_id').val(value);
  }
})

function removeForm() {
  $('#taxon_item_add').remove();
}
