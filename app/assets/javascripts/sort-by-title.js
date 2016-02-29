function setSortByBatch(){
  var statusSortOrder = -1
  $('#sort-item-by-title').on('click', function(){
    var rows = $('#link-index tr').get();
    sortRows(rows, 0, statusSortOrder);
    renderSortedTable(rows);
    statusSortOrder = statusSortOrder * -1
  })
}

function sortRows(rows, columnPosition, direction){
  rows.sort(function(a,b){
    var one = $(a).children()[columnPosition].innerHTML;
    var two = $(b).children()[columnPosition].innerHTML;

    if (one > two){
      return 1 * direction
    } else if (one < two){
      return -1 * direction
    } else {
      return 0
    }
  });
  debugger
  return rows
}

function renderSortedTable(rows){
  $('#link-index').html("");
  rows.forEach(function(row){
    $('#link-index').append(row);
  });
}
