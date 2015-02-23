$(document).ready(function() {
  $('#result').css("display","none")
  $('form').on('submit', function(event){
    event.preventDefault();
    console.log("submitted")
    var input = $(this).serialize()
    $.ajax({
      type: 'post',
      url: '/spaces',
      data: input
    }).done(function(response){
      console.log(response)
      $('#result').css("display","block")
      $('#output').html(response['output'])

      $('#added').html(response['spaces_added']['count'])
      $('#added_loc').html(print(response['spaces_added']['index']))

      $('#removed').html(response['spaces_removed']['count']);
      $('#removed_loc').html(print(response['spaces_removed']['index']))
    })
  })

  function print(arr) {
    var str = ""
    for (i=0;i<arr.length;i++) {
      str += (arr[i] + ",")
    }
    return str.slice(0,-1)
  }

});
