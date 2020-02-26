
$.fn.search.settings.templates.knowledge = function(response) {
  var html = '';

  if(response.results !== undefined) {

    // each result
    $.each(response.results, function(index, result) {
      if(result.url) {
        html  += '<a class="result" href="' + result.url + '">';
      }
      else {
        html  += '<a class="result">';
      }
      if(result.image !== undefined) {
        html += ''
        + '<div class="image">'
        + ' <img src="' + result.image + '">'
        + '</div>'
        ;
      }
      html += '<div class="content">';
      if(result.price !== undefined) {
        html += '<div class="price">' + result.price + '</div>';
      }
      if(result.title !== undefined) {
        html += '<div class="title">' + result.title + '</div>';
      }
      if(result.description !== undefined) {
        html += '<div class="description">' + result.description + '</div>';
      }
      html  += ''
      + '</div>'
      ;
      html += '</a>';
    });

    if(response.action) {
      html += ''
      + '<a href="' + response.action.url + '" class="action">'
      +   response.action.text
      + '</a>';
    }
    return html;
  }
  return false;
};