$(document).ready(function(){
  $.get('/users/'+$('#twitter-info').attr('data-user')+'/twitter-info.html', function(data){
    console.log(data);
    $('#twitter-info').html(data);
  });
});