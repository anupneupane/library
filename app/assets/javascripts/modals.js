$(document).ready(function(){
  function loadModal(url){

      $('#myModal').modal('hide');
      $('#myModal').on('hidden', function(){$('#modal-wrapper').html('');});
      $.get(url, function(data){
        console.log(data);
        $('#modal-wrapper').html(data);
        $('#myModal').modal('show');
      });
    
  }

  $('.login-link').click(
    function(){
      loadModal('/login.html');
    }
  );

  $('body').on('click','.signup-link',
    function(){
      loadModal('/signup.html');
    }
  );
  $('body').on('click','.topic-submit-link',
    function(){
      loadModal('/submit-topic/'+$(this).attr('data-channel')+'.html');
    }
  );
});