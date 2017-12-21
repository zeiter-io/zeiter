// Global Search Typeahead
$(document).on('turbolinks:load', function () {
    var users = new Bloodhound({
        datumTokenizer: Bloodhound.tokenizers.whitespace,
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        remote: {
            url: '/search/global?query=%q',
            wildcard: '%q',
            retry_on_failure: true,
            transport_options: {request: {timeout: 250}}
        }
    });

    $('#searchTypeahead').typeahead(null, {
        source: users
    });
})

// Submit on enter
$('#searchTypeahead').submit(function () {
    $('#searchBtn').trigger("click");
    return false;
});