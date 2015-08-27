// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require_self
//= require underscore
//= require gmaps/google


function fetchTimeAvailable (event) {
	 event.preventDefault();
   console.debug('SUBMITTED');
    $('.list-time-available').empty();


   var data = $('.new_booking, .edit_booking').serialize();
   console.log(data)
   var request = $.get('/get_hours', data);

   function handleTimeAvailable (hours) {
      console.log(hours)
      var html = "";

      for (var i = 1; i < 14; i++){
        if(hours[i]){ 
          html += ['<li><button type="checkbox" class="submit-time" value='+i+'>' + hours[i] + '</button></li>'];
        };
      }

    $('.list-time-available').append(html);
  };

  function handleError (err1, err2, err3) {
    console.error('OH NO!!', err1, err2, err3);
  };

  request.done(handleTimeAvailable);
  request.fail(handleError);
};

function submit(event) {
  event.preventDefault();
  console.log('Eyy Woman!')

  $(this.form).submit();

   // var data = $(this).serialize();
   // console.log(data)
   // var request = $.post('/create', data)
};

$('.new_booking, .edit_booking').on('click','#js-time-available', fetchTimeAvailable);

// $('.new_booking').on('click','.submit-time',submit);

$('.list-time-available').on('click','.submit-time', function(event){
  // event.preventDefault();

// Add the value of the time to a field box
  $('#time_for_booking').val($(this).val());
});

var i = 1;
// $(".new_booking").

// $('.new_booking').submit(fetchTimeAvailable)

// Inviting users
function create_new(){
$('#createNewTextbox').append('<input class="email_input" type="email" id="email'+i+'" email="user[email][]" placeholder="Email" required/><br>');
i++;
}


