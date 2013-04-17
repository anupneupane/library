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
      loadModal('/channels/'+$(this).attr('data-channel')+'/topics/new.html');

    }
  );
    $('body').on('click','.topic-edit-link',
    function(){
      loadModal('/topics/'+$(this).attr('data-topic')+'/edit.html');
    }
  );

  $('body').on('click','.topic-link-submit-link',
    function(){
      loadModal('/topics/'+$(this).attr('data-topic')+'/links/new.html');
    }
  );
  $('body').on('click','.topic-link-edit-link',
    function(){
      loadModal('/topics/'+$(this).attr('data-topic')+'/links/'+$(this).attr('data-topic-link')+'/edit.html');
    }
  );
});