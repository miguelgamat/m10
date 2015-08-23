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

// $('.new_booking').submit(function(event)
// {
// 	event.preventDefault();
// 	var data = $(this).serialize();
// 	$.get('/get_hours', data, function(hours){

// 		console.log(data);
// 		console.log(hours);

// 		function printTimeAvailable(time){

// 		}
// 	})
// })


function fetchTimeAvailable (event) {
	event.preventDefault();
 console.debug('SUBMITTED');

 var data = $(this).serialize();
 console.log(data)
 var request = $.get('/get_hours', data)


 function handleTimeAvailable (hours) {
   console.log(hours)
   var html = "";
   for (var i = 1; i < 14; i++){
    html += ['<li><button>'+ hours[i]+'</button></li>'];
  }
  $('.js-time-available-buttons').append(html);
};

function handleError (err1, err2, err3) {
  console.error('OH NO!!', err1, err2, err3);
};

request.done(handleTimeAvailable);
request.fail(handleError);
};

$('.new_booking').on('click', fetchTimeAvailable);

// $('.new_booking').submit(function(event)
