// $(document).ready(function() {
// 	$('#users-index-table').DataTable();
// });

document.addEventListener("turbolinks:load", function() {
	if ($('body#users-index').length > 0 && $('#users-index-table_wrapper').length == 0) {
		console.log("loading in users page")
  		$('#users-index-table').DataTable();
	}

	// Set profile pic CSS
	var cw = $('.profile-pic-full').width();
	$('.profile-pic-full').css({'height':cw+'px'});

	// Set wrapper for equal height
	var longer_h = Math.max($('.stat-wrapper').height(), $('.profile-wrapper').height()) + 20;
	// $('.stat-wrapper').css( { 'height': longer_h+'px' } );
	// $('.profile-wrapper').css( { 'height': longer_h+'px' } );
})