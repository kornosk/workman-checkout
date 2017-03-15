document.addEventListener("turbolinks:load", function() {
	if ($('body#positions-index').length > 0 && $('#positions-index-table_wrapper').length == 0) {
		console.log("loading in positions#index page")
  		$('#positions-index-table').DataTable();
	}

	if ($('body#positions-show').length > 0 && $('#position-show-table_wrapper').length == 0) {
		console.log("loading in positions#show page")
		$('#position-show-table').DataTable();
	}
})