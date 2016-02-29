function filterByUnread(){
  $('#filter-unread').on('click', function(){
    $("#link-index").children().each(function(){
      if($(this).children('.read-status').text() == 'false'){
        $(this).show();
      } else {
        $(this).fadeOut();
      }
    })
  })
}
