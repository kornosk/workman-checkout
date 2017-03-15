document.addEventListener("turbolinks:load", function() {
	if ($('body#positions-index').length > 0 && $('#positions-index-table_wrapper').length == 0) {
		console.log("loading in positions page")
  		$('#positions-index-table').DataTable();
	}
})