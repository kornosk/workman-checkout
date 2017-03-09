// $(document).ready(function() {
// 	$('#users-index-table').DataTable();
// });

document.addEventListener("turbolinks:load", function() {
	if ($('body#users-index').length > 0) {
		console.log("loading in users page")
  		$('#users-index-table').DataTable();
	}
})