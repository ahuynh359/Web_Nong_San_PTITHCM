$('#exampleModal').on('show.bs.modal', function (event) {
var button = $(event.relatedTarget); // Button that triggered the modal
  var hrefValue = button.data('value'); // Get the data-value attribute
  
  // Update the href attribute of the "Delete" button
  var deleteButton = $(this).find('.modal-footer a');
  deleteButton.attr('href', hrefValue);
})