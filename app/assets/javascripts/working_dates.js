$(function () {
	$('#datetimepicker-start').datetimepicker();
	$('#datetimepicker-end').datetimepicker({
	useCurrent: false //Important! See issue #1075
});
	$("#datetimepicker-start").on("dp.change", function (e) {
		$('#datetimepicker-end').data("DateTimePicker").minDate(e.date);
	});
});