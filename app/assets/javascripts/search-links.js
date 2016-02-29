function searchIdeas(){
  $("#search-text").keyup(function(){
		var filter = $(this).val();
		$("#link-index").children().each(function(){
			if ($(this).children('.link-title').text().search(new RegExp(filter, "i")) < 0) {
				$(this).fadeOut();
			} else {
				$(this).show();
			}
		});
	});
};
