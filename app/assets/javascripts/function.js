$(function() {

  $('#filter_from').datetimepicker();
   $('#filter_to').datetimepicker({
    useCurrent: false //Important! See issue #1075
   });
   $("#filter_from").on("dp.change", function (e) {
       $('#filter_to').data("DateTimePicker").minDate(e.date);
   });
   $("#filter_to").on("dp.change", function (e) {
       $('#filter_from').data("DateTimePicker").maxDate(e.date);
   });
 });
