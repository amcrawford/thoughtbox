function addQualityListeners(){
  $.getJSON('/api/v1/links', function(links){
    $.each(links, function(index, link){
      updateReadQuality(link.id);
    })
  })
}

function updateReadQuality(id){
  $('#' + id + '-edit-read-status').on('click', function(){
    event.preventDefault();

    $.getJSON('/api/v1/links/'+ id, function(link){
      var newQuality = !link.read
      saveNewQuality(id, newQuality);
    })
  })
};

function saveNewQuality(id, newQuality){
  $.ajax({
    type: 'PUT',
    url: '/api/v1/links/' + id + '.json',
    data: {
      link: {read: newQuality}
    },
    success: function(link){
      $('#' + id + '-edit-read').html(newQuality.toString());
      if(newQuality){
        $('#' + id + '-edit-read-status').html("Mark as Unread")
      } else {
        $('#' + id + '-edit-read-status').html("Mark as Read")
      }
    }
  })
};
