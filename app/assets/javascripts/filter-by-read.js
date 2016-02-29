function filterByRead(){
  $('#filter-read').on('click', function(){
    $("#link-index").children().each(function(){
      if($(this).children('.read-status').text() == 'true'){
        $(this).show();
      } else {
        $(this).fadeOut();
      }
    })
  })
}
