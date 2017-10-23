// Global Search Typeahead
$(document).on('turbolinks:load', function(){
  var users = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.whitespace,
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    remote: {
      url: '/users/typeahead?query=%q',
      wildcard: '%q'
    }
  });

  $('#searchTypeahead').typeahead(null, {
    source: users
  });
})

// Submit on enter
$('#searchTypeahead').submit(function() {
  $('#searchBtn').trigger("click");
  return false;
});