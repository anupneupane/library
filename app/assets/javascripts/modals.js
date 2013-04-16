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
      loadModal('/'+$(this).attr('data-channel')+'/submit-topic.html');
    }
  );
    $('body').on('click','.topic-edit-link',
    function(){
      loadModal('/edit-topic/'+$(this).attr('data-topic')+'.html');
    }
  );

  $('body').on('click','.topic-link-submit-link',
    function(){
      loadModal('/'+$(this).attr('data-topic')+'/submit-topic-link.html');
    }
  );
  $('body').on('click','.topic-link-edit-link',
    function(){
      loadModal('/edit-topic-link/'+$(this).attr('data-topic-link')+'.html');
    }
  );
});